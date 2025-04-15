Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5BD19F489
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724906; cv=none; b=tVaPKf+kPJPyrOG8j++qoD9kxX/rawye2MxJa/8GPIaHmX5y5GZgTFxDR1yU+FKEmd9CKQkRpUPmTAqnXhwE33uU55zt61YlopzyPq/DbIB1GLicLRgXdskAcyqGFkyWmoy5Tdv8b22t5BSNEMyb9KAU2QJQiQMtePb/4dhfe5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724906; c=relaxed/simple;
	bh=Q+sDbI3861ztbo49i0sAnnGzYlZkCzWiWh9KZGjrKpw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eLi6u5jwbcappz1sDSiHSPA3psJtFBD9oVSK5bZJRznw++oIenfq9ubWhCQdDaG8maizUZtbgB0lrkyM8cvPqJTVBgsFnLeOOzuc8RuCnK2VWR9bwh/GT+eyg/QpmsUQ1W/EJPi5nXho8QAAvDLEOSuqE9euL5RK0gVOtWa9CmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=lqqz+gYm; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="lqqz+gYm"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86117e5adb3so181680439f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744724903; x=1745329703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEbQBiFiZFwJTl0Yl+XvYCk4r5u+r4E4QzEsUOtsGLs=;
        b=lqqz+gYmBLQjpE3UMAPt42C2s6qkkCbzRooU3NR5QnNjByUUFk4PNQP68W/4P5mXGm
         qIlKy5na+Sgf0gCaVRNbBgbZ++ChI0yxnXj2FZpqAPTBjGqqz/cjtzw4capEn9lipjE9
         pMm7EV49LnYdJI/EVZdZ4tJpRoTXA8yKi04mJ09GpZE31zkg0zrwCwo8tZ7pPrqe0q6E
         3x/a3IA1tCfr75XVIEgpQsBSWR6Lqs8nymGtlv31xEf88QAV1di/ABWnbk/IgA3PGhMa
         nHE9NM3A4EnsxSMohllc7qTovOkhphaDzhayLco6fL90c9RO/Dwkj8j/zDgVXXdQthQf
         RfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724903; x=1745329703;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEbQBiFiZFwJTl0Yl+XvYCk4r5u+r4E4QzEsUOtsGLs=;
        b=KoY3mIxamKUaR514tY7eS0NvKK7pri3rhSB1ugKwgIhCfeqHV3AWVBEYP8yrjPWISH
         kVvRhLLQ31KnD8ubCpb7BWqYbhYD8/+/WZwUK9/it4oZDhG3haqCosGwRMz4Ai78RgZe
         mBOe+E7SSMzWifEw/kdMx3tQ8oOUGNGV3r+ldHgGwcmEBLDUBVmT0S6VSprKZzDP8S4x
         hbBO3rOswfjN7/FGFkiHwHHuKwUCbFsOUt2m1sVVWLPnxxHtOAC6GWnKmjgqePraC9B5
         RjiQWS7lmOxhVzmqtsW6HNQrR0CoUvJ+9ttGJZiqMMs54XCxJPXgRfER1zpsKLxs970i
         oaCw==
X-Forwarded-Encrypted: i=1; AJvYcCVAijrpeQdUeg/kdMQeSvM2jj5DOKUYizkFhmGFijyXK0Jo1j0XW4El4HB2V1J+D6RKrQQMQTZRaaUKeNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDSFVXEF/oEQileEyW7Euy71ez0rRI8W954Y/AOjyE/PZZqwbZ
	IPRWIPHbdv3vU7UffqetnM//cwerQG3LkvOh4pBWqnuULdGjZnR5ZhMXntVWmTk=
X-Gm-Gg: ASbGnctqt2JwOegbbFmImSERi1kEr29xw9ffhVxAOalJQJRoLVsGIV9OxsN0tzFguNb
	OOI28eqYEzyh10MjeYRkXaTlYR0u7CK/FPWNySgnGzqp/012Jq+uCHlKK/Rkb0kaPyECw+qiB0r
	w4IVM+w0A8quKcIH4cEp9tL81KwKvYROPHTmT9+DyvBzpZhwonOvbiFyAxZ8h8sxKRQL501cttC
	mYYiefxWjmX+DLDmEJxCoD2Z6/AUWz9xbmsLY2o9jGmADK45riQk+AZihEOkkSfO3OADbfayGXf
	0c/XrjFeWdCGxi9DZs5P5MNS3ip3uly35LWGnwwbeYU=
X-Google-Smtp-Source: AGHT+IEus8WSuQJc6+4zLbZc/MnR/075iVtowh7y7vuln/ACpKCLskT8RvCvla7P/9LF76osem/z8w==
X-Received: by 2002:a05:6602:3890:b0:85b:6118:db67 with SMTP id ca18e2360f4ac-8617cb59f52mr1693574139f.2.1744724903703;
        Tue, 15 Apr 2025 06:48:23 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505d3c323sm3123456173.74.2025.04.15.06.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:48:23 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Martijn Coenen <maco@android.com>, Alyssa Ross <hi@alyssa.is>, 
 Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, 
 Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: John Ogness <john.ogness@linutronix.de>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20250415-loop-uevent-changed-v2-1-0c4e6a923b2a@linutronix.de>
References: <20250415-loop-uevent-changed-v2-1-0c4e6a923b2a@linutronix.de>
Subject: Re: [PATCH v2] loop: properly send KOBJ_CHANGED uevent for disk
 device
Message-Id: <174472490268.143017.12721024881216566078.b4-ty@kernel.dk>
Date: Tue, 15 Apr 2025 07:48:22 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Tue, 15 Apr 2025 10:51:47 +0200, Thomas Weißschuh wrote:
> The original commit message and the wording "uncork" in the code comment
> indicate that it is expected that the suppressed event instances are
> automatically sent after unsuppressing.
> This is not the case, instead they are discarded.
> In effect this means that no "changed" events are emitted on the device
> itself by default.
> While each discovered partition does trigger a changed event on the
> device, devices without partitions don't have any event emitted.
> 
> [...]

Applied, thanks!

[1/1] loop: properly send KOBJ_CHANGED uevent for disk device
      commit: 7ed2a771b5fb3edee9c4608181235c30b40bb042

Best regards,
-- 
Jens Axboe



