Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452861D88D0;
	Sat, 21 Jun 2025 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750502587; cv=none; b=FVW16IXHvCmreoV4QC1rFZ9HaQGO19WWx7xX75kGKpZn7B4B993H5ZnLacpByNetRq1U3MwJ8GqksWJK0F+QreucbMIzu2FPbsz1CyC6jE2X5jocboXMGgDHpie6yohRDP3PcKRYwXVlkMPbS+3kAYawUDNLz8auBxxiHYBtXXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750502587; c=relaxed/simple;
	bh=vsET1sr3JKygH7vW+tOwIXvef7FLRml064Ui6oUbEO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NeaA+heSzNxU9SBq8H62hCXUTDr8IsIi2f3y9NUs3V+Wzr/VGhLOhJ8HHXUtltwXLu5bPEuEqArCQ1agyqa2ouosKvaTrltAu490Ku25Dz1Sc2Hjuc0utnKOGXVnH/5S5qAV82VV0ywmg6Pa5Nkzb20C7vdIph7EseY6j9ixoQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvD7cN9J; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvD7cN9J"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso411322f8f.1;
        Sat, 21 Jun 2025 03:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750502584; x=1751107384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXbJRBNdSzoj9pqt6kPsHl6k7CtT9CMk8SwNSa60b3U=;
        b=KvD7cN9J5cv3mxt+S9iUiymHBYGxzG4Ty0G94ME8c2R1EMNXvFyY1ZdsnkSi8RvPp1
         rwywytfXGm9UeMPuex37BruFKnEcbazWg6KRZ3L4PjyXqpJUZyCv+Afh2um0G76Hxx6n
         9mIgzu7WHd2ZWWUSFwd5QMv4mRyhKeLT/BmF55QEix7iMQgTB+YoZiiBprniDYt6r/3H
         4pR5BCOPaHw05T6fV0VPu/pgOg6nvv0H4vttsZXTn1K9qW4s9gBVrcITyhCgMIkXuG7a
         bchkhnpzDJgGo8QeIxxaBonTnwxe9YIsGoYAGHTIKxgFc+a1sNZSCGToIxzSkjvdsOUR
         15EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750502584; x=1751107384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AXbJRBNdSzoj9pqt6kPsHl6k7CtT9CMk8SwNSa60b3U=;
        b=eO5ymj1wzwrjMzQ8PwFQr1srVzZr2GADtiVeFFv8wui13CqvRxhSeZaxrQwj1V/mbJ
         5emACW3V71tqHstdY5d8Qn0yiDT3Vt8KdUulPgx8jqS6mvIzWjkpLwHSwPY/GUU85llY
         DDlmIQIPWLWfcuuvzwNAWi5jwre++yc7WhBY06ArHVlujhDR6Xja45XYU9ajC8Fh3u/t
         21XNswJN+cd9BMgJG7GlxwFHYAJEo4kaa2FtdoQ9dHcH284koWjMVXd+Ywp/c4cnH08C
         JPR8VpSC38+lIrS05nXRT9WlG+zttgBpZYB2gEesUIVnLMsXlTbGGm5cQFAKwu65s24c
         Bf1w==
X-Forwarded-Encrypted: i=1; AJvYcCUH3WdgoMV6hqKfnbKmrVRIvW1n47MlFzhHEaxUdoLpZwqFV1iihEwmgUNdmRKovpYXmhIxsogf7wWGgg==@vger.kernel.org, AJvYcCUU7Cv6jh5cDPfogpMKpUt0M5KpJe/LqRT/ocaOSzs/BnVFCfUphlNYYnRrFQwY0E8SrzSBzca0CsUu6JY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3PNo0McQTCdmaRGCz1tyCW7RGYAkQZRc190VM2BA6K/ZyKN5a
	IsTk119Dy+YdUWpgYJD85axOQhmPdBPLcKUgPu9WUQaQjvW6UyR+14Y=
X-Gm-Gg: ASbGncty0Pyzw8ZSmU97eVGjvz0X45tJ44UAQ3w4reKTd78cUILzLSGMqh3p2RmH3Le
	LqRZ/fLz2jDEPUZUgkjPr5er2RKi/Da042ixhs7sz6MoT0iQ5V+Zvy639BrNwmRXKyCAw9ES96R
	LQGMHTML1ik7lEctyJr+BauI+VOZxg1n0fRzNbggBIZzhHDa7Q/itrZGel90s7sqdYmbCpYy+qg
	cDV22g8x/RFvOiuaAYJBO54gl4YJPzqw7T7ktXBMMMF02G5KcXm93IRRM1yOaTj5dOREozhmnzm
	zIfTpNtIQX9jp52ua5pRs1U4xnma3bcFegeSvpv4MGhE9clHZxC85jpyghchxMtnwf9IwrqcUwF
	OwIWylIRPjcZa3bNbK0E5
X-Google-Smtp-Source: AGHT+IG+YcRiSdXXd2YX+u1pCamLdaM3/+OnN+yr1JMS2O64adNBSDVRPWUqtUvqQ6sPyWHteUxwDg==
X-Received: by 2002:a5d:5f50:0:b0:3a4:e740:cd6e with SMTP id ffacd0b85a97d-3a6d12ff2acmr1552336f8f.8.1750502584339;
        Sat, 21 Jun 2025 03:43:04 -0700 (PDT)
Received: from localhost (8.red-80-39-33.staticip.rima-tde.net. [80.39.33.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f19e7dsm4522446f8f.38.2025.06.21.03.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:43:03 -0700 (PDT)
Message-ID: <3236c17c-2861-478d-b094-0944afba4874@gmail.com>
Date: Sat, 21 Jun 2025 12:43:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] LICENSES: refresh FSF GFDL/GPL licences
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 LINUX SPDX ML <linux-spdx@vger.kernel.org>,
 LINUX KERNEL ML <linux-kernel@vger.kernel.org>
References: <20250621012117.91729-1-xose.vazquez@gmail.com>
 <2025062111-detonate-clapped-b630@gregkh>
Content-Language: en-US, en-GB, es-ES
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
In-Reply-To: <2025062111-detonate-clapped-b630@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/21/25 9:20 AM, Greg Kroah-Hartman wrote:

> You also changed whitespace and some terms, and did not describe that
> here, why?
> 
> This license text comes from the SPDX repo, why not use that instead?
> 
> Or better yet, _JUST_ change the address, if that is correct with what
> the FSF has published, and that's it.  Unneeded whitespace issues are
> not a good idea and not needed at all.
 >
 > Please don't reformat everything for no good reason.  Let's stick with
 > what spdx has as that is what everyone has agreed on.


I did not touch a single byte of the original gnu.org licences.

Just deleted the text of the licence from the Linux file, wget it from gnu.org,
cat to the file, and did the patch. Plain and simple.

If there are any inconsistencies, they were already present in the Linux files,
and/or spdx.org.

I do not like to change any part of legal texts from the original source.
Even control character cleanups (^L, ^M, TAB, ...).

Thanks for your time, but I am not going to do it.
