Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812C825B698;
	Mon, 10 Feb 2025 18:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211157; cv=none; b=EiGCuV5fEl6WRVPGO+rpQXIkhsbL8VJI2GstHevsdh3bv0hcZ1ZT1W4mklXtSBCRBbQrdfBKUpaUQ5t5nElxCzqvA/rPQDlAr3QlvGGVt7dawbLMHFfSn4TCDmT2/OJVbAPymfpPFVmIiXXdCF9FtV8t4F9lBxrHwecn3dJmsn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211157; c=relaxed/simple;
	bh=1BaICnZIMZZYA4GVJPiSv2t5sFyRoKtIBGOBza+NOtM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WPWKPAuB3R6H0ZCql7Q64QOFElR50qhigjBRlQ6w5kQ0cPHurZqAon/O8r7G8h/VsQU/c8bP9SWOm/ucRSTLWJpi09aASeAYRh9RnkyKhvkgAQFbuNghCZiAHQXD6twCPnt3qiAZ6N1lBKnq7cojFrZmxI5Ca35Ekyu8++T99pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kmEcP/pe; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kmEcP/pe"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A06F5411A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739211154; bh=Sla1Tv9LQWbirw8afTo3m5hwu7soC846kdNCn4I82iQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kmEcP/peMIXBD4I33JiGLMq5dlJbEdIpXD3Emg5Ab8R+ojwKefAR92aqkugY9ZAzk
	 7yG2MCTpLNdeaYm3iG8a0pWdp8b4LpfpoxPqEG4NMZ7wpvPrqNTcVkE6LvHysBBdb7
	 YfZU5rjWpY4AKXte/zULhO4oEeKWX7x4f/O66fH69EESK+r7Z9eiSxP6sBmZ6wxYZ6
	 6Ipi168BtTEa0p5K1wjyfRCsJtMk6SD2AwvgSchFXSHmj3kCGocdnL2Gc3OrxFdRUD
	 Dn6sengxbA8DCPTnpaT59M/Ecb3/SSu+LHpQVQDzUmmnbGOVXptf6/9xwiG39RxWEu
	 PW4JUyhezrIMA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A06F5411A1;
	Mon, 10 Feb 2025 18:12:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4] docs: clarify rules wrt tagging other people
In-Reply-To: <588cf2763baa8fea1f4825f4eaa7023fe88bb6c1.1738852082.git.linux@leemhuis.info>
References: <588cf2763baa8fea1f4825f4eaa7023fe88bb6c1.1738852082.git.linux@leemhuis.info>
Date: Mon, 10 Feb 2025 11:12:33 -0700
Message-ID: <87y0ydzn1q.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Point out that explicit permission is usually needed to tag other people
> in changes, but mention that implicit permission can be sufficient in
> certain cases. This fixes slight inconsistencies between Reported-by:
> and Suggested-by: and makes the usage more intuitive.
>
> While at it, explicitly mention the dangers of our bugzilla instance, as
> it makes it easy to forget that email addresses visible there are only
> shown to logged-in users.
>
> The latter is not a theoretical issue, as one maintainer mentioned that
> his employer received a EU GDPR (general data protection regulation)
> complaint after exposing a email address used in bugzilla through a tag
> in a patch description.
>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
>
> Jonathan, what do you think of this? I felt somewhat unsure about this a
> few weeks ago, but I guess I was overly careful. If you think this
> change is fine and shouldn't cause any trouble for anyone, feel free to
> merge this. And if not, please speak up.


I have a couple of thoughts, neither of which is sufficient for me to
oppose the change if there is consensus for it:

- You're saying that people need to grep email addresses out of the git
  history before crediting them in a tag; that's not a step we have
  required of people before and seems like a bit much..?

- It would be awfully nice if we could provide this advice in exactly
  one place in the document.  This is one of our most important docs,
  and it is far too long to expect new contributors to read through and
  absorb.  Avoiding making it longer and more repetitive would be
  better, if we can.

- I wonder if it would make sense to say that, if an implicit-permission
  tag has been added, the person named in it should get at least one
  copy of the change before it is merged?

OK, three thoughts, you know what they say about off-by-one errors :)

Thanks,

jon
