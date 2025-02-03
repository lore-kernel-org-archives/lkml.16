Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D8D20E711
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615669; cv=none; b=kJSqsBGDOqUJc7uETZcuKj0apD4F7uKmZjsRTyPVvH/4Im/2buH6HJB410yaDRcU/CdOWAHCCBkhy9JPgAcp9QVeEb5qNjAdJYRs75QIlZtbWB6wOwoGoc7BVjvXaSX7crg/XVklYht9QROUVfyG07B/2Q0Y6Y4BuFmezmPZnig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615669; c=relaxed/simple;
	bh=LloDikGXVPRMEPUAnJ+qLMXbFAHrnLigGMI5RJXs7R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJW6F3tNDte1H0XGhhkr5258pCCJ8oxBxZMvu8uApzkR4T1eIhDaErgEXRWb824mHje1DzS341hb4aReXuQugGGF+TpEk/w19kEkllOS5rKUvv5v+LDB+2ikRaCxhbnOcBwUXFyi+V3zAxUtKyYdfKuD+o1BF+IgeoOP5kh3iqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=IH01snBi; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="IH01snBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738615660; x=1739220460; i=deller@gmx.de;
	bh=vxUrHWDFYqpfom4VV3SGRl08HvrywEpv/nammwmWP34=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IH01snBihSOB+MhxZXxmv37vkK3feKyOe6nBv5JbbMPjV+BbPYYCm9f3sm90y47j
	 eMk1p3C/dJKIAXKsBEj5Czq84BKV+uYqH+ANMUofF7zMTOconjKxvkfsS4a5K3jcL
	 8r9XhB0ninX9URFfxh4geMg+wlzEbbY9ALHbdmQqB/S9IevE+zPoo/Dr5wOuqgx7Q
	 r6KJPFS73NOzjhuzG/CTx77TtTS57/wV/TIM7j7UDjVruvYhUPIneV9YaP4HdHghO
	 jU5LrwFApFxaN7ruQL+yQslozIQkCL7+ArGBbPvUVdoKj5dAo7mY7Ap2FFaP6EkV3
	 m6qNjemXdjO1Sm4sEQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.6]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1My36T-1tVe310Q1v-017OVu; Mon, 03
 Feb 2025 21:47:40 +0100
Message-ID: <11f6ec8c-bf8d-49a3-8de6-884f73b47a09@gmx.de>
Date: Mon, 3 Feb 2025 21:47:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] syscall.h: introduce syscall_set_nr()
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: linux-kernel@vger.kernel.org
References: <20250203070031.GE14120@strace.io>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250203070031.GE14120@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kY7CqqozQP4Nl4li7qaZLkPHRWud2FbSSE3eX1lv0jTs9cFASC2
 EO9Abbr5w436Ky0BYDE3MAkP7qAf2b/K/KrKzW7ZcWxwHi1SNdTLiPFwuz9UM4CD052dkkQ
 B3L7jfDs9UAQf49gJLCnnuIsUlKbgQ6BF+xnR8tOLLE97y5K734kBy3BIfedM/7wFSZX+3R
 haowtaQwm4n6sCWD3RgvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b28C5oy/Oqk=;6BDh9eT0Cd2rfTGBaXUGBFNRSv6
 7+JLyfm30ZetvV+5VsduaxZkoM2oVEPiVuMaSI/6AyxJoY6lPB21LGKbDamxXoC9RkmTa04+/
 6deOXpePn3ORtG7+12G+KzWrZ8wUAOflEDUkd8JLlpJvUkfwp260M7u9QlnZk5TlFzkzt1wtd
 jRhkXF7hqJEp4DBGYT8OzJOSiZTMHqLxGyLBVBD4BNhJvt5nuy1A5OuAk9lQG4NC+8fC3Nj+X
 qfBe5axeBoPMAvdAsPRJ2WlBHTTyqEpoqAXLhWxW1HdMY3fCeeNBXYq8ekbo+uvnrQsFRbv3Z
 Xt92ykKSmxPMmCxLG3Ak4/lQnqbXMrncKG0kzgd73fIrKcnJCg7vVw/dU//33YIVf0E2L4P/P
 BULQ95us6Wl3g/VwfwJBGb+qF6nn+Cf1c4VZRjmRXlnrXn8uki8c3kR9J2FKNykF7TTkng3Qe
 GQMwpKh8LGmhSnU/F36eeLM2nmawSYSyoh8FfLGbXrrEZm/VM+qjQhlnz+XLXIv8FDTd6EwQK
 o6fenU3VoTlxiXilU+Uf44WNK7B2LouyObR7GJlqZEQTbFmvliBiicHE3cvOavcuDl0a9P0Oh
 1czK1cl47Ao3vGV00im1JqIXbvGLTBwEWhgi2xEtSkRagRuH+bQMRQyczqGzboIhOcOhIRb1k
 28WZUxXv0EQ3Yx0dgPlsbNn0nT6AcKF4gt0prNgDob0Tv+6vWQ8eKqo56OwL5iH9sHW/PtGsh
 nUHBoqaKMW9RXTWv4TlieFrYlHdn790dvv7VtanTuNBK1gz4ola656ZIWBGutXGS0bPZECo/r
 86mIHSvc3xqCi719gtwZCNF2CXkZx0iG1kHPqkouuMsQsyVkqzCOD0ey21AVs1Gt63wwfLNHR
 aNUmWuC9MUwE+8AyUkYFWTKPinfxNx61DKQjM7HRvTzvJ579yf4K8mOQmVaqAsTqI78MRoVK2
 TLHBmvcaXvM0tP0AdlQHrZ9kKm/iczLqn6pllb9WaAD9hnUULf5e4UbeWHqdkrwfMZOAW0jon
 j0cL8s5hOGL2+D7AoWxzq582cHXAiUuG9fMcw19Ra0n660GHeKPaHUNmryXVxu3c4qkfFvtkc
 bxpg414p/RGB+qyKRHmtfDp3tA11/rv1P/3TdrFB2/vqgehf8AtFClQ0s4AdBq1iBDf7BvsdN
 9KVYrJ6+pFR2JPMT2c85ikJtJwO8+ATAb+brUU8/8iQDhEsEqb2T//3imWjpcvyPXuF3IA5mc
 zHzf7VSJtY9jx9l2VWBpkAaRS7+0EjtycCfepbmxcZ270mtyfTkg0N4OvLdQiYPfUxDa4KUkd
 3XiiB6PmoPU39SDeJ7TsKgYb8A0NrIPLuhG494IeY4D9/Q=

On 2/3/25 08:00, Dmitry V. Levin wrote:
> Similar to syscall_set_arguments() that complements
> syscall_get_arguments(), introduce syscall_set_nr()
> that complements syscall_get_nr().
>
> syscall_set_nr() is going to be needed along with
> syscall_set_arguments() on all HAVE_ARCH_TRACEHOOK
> architectures to implement PTRACE_SET_SYSCALL_INFO API.
>
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>   arch/parisc/include/asm/syscall.h     |  7 +++++++

Acked-by: Helge Deller <deller@gmx.de> # parisc

Thanks!
Helge
