Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC45262FD3
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746479408; cv=none; b=Xt9oJmUj9rzXb1GdgxvjUCemkdccahJVi5aquXPwXLf8IZu7nH0xjyj/aVVPYY+LGRPCY5UEG7ef3jzlUrA+ieCezGHyXvGOdfP3mlmQiMfqqdrtarJ9a5HFwWM8fQajDdhYS3WpYlym9ffXM3iNiu/D9n1CI3ztoQr0JksdZP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746479408; c=relaxed/simple;
	bh=lfzmpTI5Zy2UVhF4CAX1rxW4vQswe/zK8UGIQIoY42c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1j/xgTzO8sHUQjw4bHo/vizt47GS81jkC3hofjvwpDvLPwkMCFfupxlCoR6CzftHEz77ng7nPgtZttRGbOxKyQsjfJZHb48fX/wr4/+hRP8UHP13c3vOIuUMo+XbhlrmdrivJFGWOe0pySHz+CctYMrNKeMtHJGYne+T5WjnSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=oB6QYGqx; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="oB6QYGqx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MDcQlJn8nq2GB8lUZMQzSjuo5eyn1SxZ+f3uLHRF0Mc=; b=oB6QYGqxQpB64DXTDqut7gEcDW
	j2nEXEXiMEhepsGSF2TcRfIaQRcw940Nc4VvEdZpqifi9a3MG6mE0G1P2x35a2F1TReV66a17XED8
	3FIuG+1atQuBN2T6riBS6iDpOyRni6nFffw1iFgKHpJWa1eM3/TDeoRfJ5HrwlRIJIxSU+tph7iZR
	hilW0DZi3sSIPlEmsW4ZvFG8R4Bp2SjIHai4S+9M+6kK7pMAmbVVRPzfWXbqbkeiZ1hXIKFNfRX9P
	Rp2C731fchj4qt7dDI+EdFOxgoxpfyey2I3omfw9pt89TX+nf75Av2miLIqMqxfQ5XuO7ja0miDeR
	5+/K8HUg==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uC317-003tiI-Ps; Mon, 05 May 2025 23:09:44 +0200
Message-ID: <f86db0fc-83de-4fbe-bfe9-9e46ed028f31@igalia.com>
Date: Mon, 5 May 2025 18:09:41 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/21] rcuref: Provide rcuref_is_dead()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-2-bigeasy@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250416162921.513656-2-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Em 16/04/2025 13:29, Sebastian Andrzej Siewior escreveu:
> rcuref_read() returns the number of references that are currently held.
> If 0 is returned then it is not safe to assume that the object ca be

the object *can* be

> scheduled for deconstruction because it is marked DEAD. This happens if
> the return value of rcuref_put() is ignored and assumptions are made.
> 
> If 0 is returned then the counter transitioned from 0 to RCUREF_NOREF.
> If rcuref_put() did not return to the caller then the counter did not
> yet transition from RCUREF_NOREF to RCUREF_DEAD. This means that there
> is still a chance that the counter will transition from RCUREF_NOREF to
> 0 meaning it is still valid and must not be deconstructed. In this brief
> window rcuref_read() will return 0.
> 
> Provide rcuref_is_dead() to determine if the counter is marked as
> RCUREF_DEAD.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   include/linux/rcuref.h | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/rcuref.h b/include/linux/rcuref.h
> index 6322d8c1c6b42..2fb2af6d98249 100644
> --- a/include/linux/rcuref.h
> +++ b/include/linux/rcuref.h
> @@ -30,7 +30,11 @@ static inline void rcuref_init(rcuref_t *ref, unsigned int cnt)
>    * rcuref_read - Read the number of held reference counts of a rcuref
>    * @ref:	Pointer to the reference count
>    *
> - * Return: The number of held references (0 ... N)
> + * Return: The number of held references (0 ... N). The value 0 does not
> + * indicate that it is safe to schedule the object, protected by this reference
> + * counter, for deconstruction.
> + * If you want to know if the reference counter has been marked DEAD (as
> + * signaled by rcuref_put()) please use rcuread_is_dead().
>    */
>   static inline unsigned int rcuref_read(rcuref_t *ref)
>   {
> @@ -40,6 +44,22 @@ static inline unsigned int rcuref_read(rcuref_t *ref)

Above this line there's a comment "Return 0 if within the DEAD zone." 
Perhaps move this comment from the function to the kernel doc as well?

