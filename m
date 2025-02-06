Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF566236426
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853904; cv=none; b=qMKFBu0AuE1DOWtoWAKlj3lFs9mTdhyPkSd+Zu5F7M6Knh2gCcgmUasF1E6DtKLG6NE3olF2zsf9svx9oWd9/01JS8Lv9ITak7nEVwzQRncdpZezo0/ClvsFVV2BBgOUVaMxg5nuHbGMAUOb2JpiNE3MV4WkzGL8HhaCzZ4xzxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853904; c=relaxed/simple;
	bh=oKAaYPv6jRnGeRLrJfZOqe5rRymQLsDP2aoUx2/x/88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ktvz61q0lA5XSLGuZaNZrdT3QMzmiN0MG+AhQuGGVZ0toQ6QVoXMicByd4Zk9TGR3+6cqd4l9Z2+v6KUo9QNtpd7Qh0TqD89pZW9xWXBT+D7ObY95y94/SxAkzR7LO3UbsBRc3dEpBsaw4kj3asqKIlsn7r5YIA1Wh8vocG1sh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MHE8iJNf; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MHE8iJNf"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e1b11859a7so6545556d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 06:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738853902; x=1739458702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XNiQI88qQ2M3rNYJ8bg9PlmEeiuvyHgd/qrJv6wRMYU=;
        b=MHE8iJNf+rYGtcW4nnAF0T2VJaagB3vuWYgAsAbaUlDXHoChkzJYlXbnEULiz1DzIC
         /1hjY2g1GStAK6CObMTRTCSgQv3F6c4lGYpNCGJA+AFw2sKsAx53C+5l2TAJCmiyImU1
         zvgGBwtX+eRluGEr00qwsHxrfo7GEmJa234DnPmkxfSGJIBH1KuNx1mhWp0GBk2T8Am8
         5M7oRF2XBst+/9xtlm2Is2TO32jMBiV71mK7llFjnh6ailkMQGiQNNBvRXgNLL1lMcXP
         l1+Fgl5RJap1ZGE6t/l0cpceZz+YgEctnpoaovQReHBV6zxK7k7voNb1SJCJKdB0Q1NO
         vslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738853902; x=1739458702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNiQI88qQ2M3rNYJ8bg9PlmEeiuvyHgd/qrJv6wRMYU=;
        b=GK5q71j64J5bY+vRvE068kfKyxJDznkCPHxetdkCT7EUBGd9ZENNoUI4Y1n3gmKd6s
         cHwjtoDXXneV/aN5bp8vPj7MZ229lnoEbXdW8YbMOhPiMO4ZzGsq8vrkiq/toH/idDVq
         DP44lcUEAl7Z9iotwHVU9qxXkTx7hi0/0DyZCQ8oEB8q75OrpQgzwMbn8wJ597PNmcP4
         4IWtbsux9dOjDCNvtgM/GvANAYTpNbd329nbh6ak5wC6TQAxpZiFQVgVBiptJcBkTJhg
         08RrzsdH4fm4jgbGt3jCEBuE3K62QMFCqWkvJ+CJz0BUFGFNDGiE+n5u+WPA+oMl+ip8
         76SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQB/rfyxl/++3waOBmfiG913GofFaPmIFqI+3WDbBvPiFbN5lvTBytN1LXJ1NZa8JtjQKNhqQTJ/5a5WE=@vger.kernel.org
X-Gm-Message-State: AOJu0YynOXdcvM+LFirb4JLtB/qwHWfzxaZdktqzZW5UHQ96EnO3htAF
	bfjAS6HBuwQ1FGZG3LiWfbtRKPwrE5A02ABfwizll3B4xz0I4mBFDBP0r3vUcA==
X-Gm-Gg: ASbGnctDofxvBzF5MueoWYqpEQy8V/AcYByKKjyu2QBWYpG29CrkX9UOa2HtRuthqIg
	0WQ/cEv9uwy7FwzYVI1cg9SIGiJsMq647R9LnoOqG6+WwCslOPI1fqBe3qEum61W7Wmg8B0B3eR
	GlQSzdEEVT67Le4iHxsoCXVhl5HrAOi+YpWkhE/LMlg1pbb4LHD0Ak2KLF4o6OkIlJX7FNDc6JJ
	7pUcQQNIzJiDLiMSlaXCDAj94iOPhFPggEXRxGkB1aBujhyX/5LLo9NIiyOadgQlfuWcH0exre5
	HcBLueWezNwZ/67g
X-Google-Smtp-Source: AGHT+IGwTVmRqwtXcBDvN8EgzQ6uI23+vsJwHbkBFH2sBMryDYiMUMDsVVEPOsURI+KP7I6QNQcsBA==
X-Received: by 2002:a05:6214:2029:b0:6e4:41b3:4972 with SMTP id 6a1803df08f44-6e441b34e15mr10049126d6.43.1738853901763;
        Thu, 06 Feb 2025 06:58:21 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9345])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153bc75aesm5953631cf.64.2025.02.06.06.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 06:58:21 -0800 (PST)
Date: Thu, 6 Feb 2025 09:58:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: WangYuli <wangyuli@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com, guanwentao@uniontech.com,
	chenlinxuan@uniontech.com, Xinwei Zhou <zhouxinwei@uniontech.com>,
	Xu Rao <raoxu@uniontech.com>,
	Yujing Ming <mingyujing@uniontech.com>
Subject: Re: [PATCH] usb-storage: Bypass certain SCSI commands on disks with
 "use_192_bytes_for_3f" attribute
Message-ID: <80ef917b-3680-4f85-93ba-c92d2b69ebaa@rowland.harvard.edu>
References: <AC1BB7F0327EFB9C+20250206054107.9085-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AC1BB7F0327EFB9C+20250206054107.9085-1-wangyuli@uniontech.com>

On Thu, Feb 06, 2025 at 01:41:07PM +0800, WangYuli wrote:
> On some external USB hard drives, mounting can fail if "lshw" is
> executed during the process.
> 
> This occurs because data sent to the device's output endpoint in
> certain abnormal scenarios does not receive a response, leading to
> a mount timeout.
> 
> [ Description of "use_192_bytes_for_3f" in the kernel code: ]
>   /*
>    * Many disks only accept MODE SENSE transfer lengths of
>    * 192 bytes (that's what Windows uses).
>    */
>    sdev->use_192_bytes_for_3f = 1;
> 
> The kernel's SCSI driver, when handling devices with this attribute,
> sends commands with a length of 192 bytes like this:
>   if (sdp->use_192_bytes_for_3f)
>   	res = sd_do_mode_sense(sdp, 0, 0x3F, buffer, 192, &data, NULL);
> 
> However, "lshw" disregards the "use_192_bytes_for_3f" attribute and
> transmits data with a length of 0xff bytes via ioctl, which can cause
> some hard drives to hang and become unusable.
> 
> To resolve this issue, prevent commands with a length of 0xff bytes
> from being queued via ioctl when it detects the "use_192_bytes_for_3f"
> attribute on the device.

Is usb-storage really the right place to put this test?  Wouldn't it
be better to put it in the SCSI layer where the ioctl is converted to
a SCSI command?  That way it would affect all SCSI devices with the
use_192_bytes_for_3f flag, not just USB devices.

Also, instead of making the command fail completely, wouldn't it be
better to change the transfer length to 192 if the original value was
larger?

Alan Stern
