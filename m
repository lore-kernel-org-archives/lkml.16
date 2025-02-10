Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68441DE3A7
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183570; cv=none; b=AFrrw4ZknUQS5Pkc9NTz6oqjwvUYO3zmG4de6dh+Oggs1cl0Gs88tfYdE3exm6m93TgRU7C3axw21OKm+qSJ5ZzC8e1eXhhjDH1FtuAcrWi6DnRyqYlOEF1b68vwICd2TT2ZDZoPlK2Q1px6FtNSlZFGB/44HBCuj9smsVNwX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183570; c=relaxed/simple;
	bh=y2Kjz+wEgLrDXA0fw5KXqQvxR9D0mzjbBUTrNdZiE00=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tUrj3QxWvB3lwfmNX/ZIV4F3wBdIXuaJR/hcv2mDcnCaBneQndD4/l6n+imL5dlwmmRiYti3+ol83auVLW+ePm5NmOGac5+dYM3ir79EmCWmMRoy1CXTgjode+Zu0D0PazxRRrRM5xtzf6varAm8pPjY9h+W7qPD4D4jGKrnw2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--chharry.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=08edtTJf; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chharry.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="08edtTJf"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21f63226a32so48396825ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739183568; x=1739788368; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ruKvlYPR9RtsIfApZo26NnChDR1/Bd45toLodT0asyU=;
        b=08edtTJfsoYCgnMeTejIQ2a0losH+fvlhP3jxNVH/ErO95DIhPLYrtN5fNPCHBnptS
         OYnMbfXciz6HSY6mq7yyKCIEdeD1OMYDkQBDTTBEAKXmqKSlaz8idJUYPjXTcm2kPLKv
         BG/JIoSHll43WNi/f33bNl6rZZDtkfOzL8sVP0SFdD5hV/Atad5W5UheY5GNEv+ocEzg
         B/rAEzYLq8ivcpj+xu2ZfWS9D9/JNf3OaID5q8aTD0atAKPqRmXrKSlDACOpYNzN7W2D
         xfYSXXB2Cvhdlxxi3q86IOQvstpKt/04rc8I/TPlJB4xpqmjKsRIp7XdRjxRjWp8ecd6
         i04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183568; x=1739788368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruKvlYPR9RtsIfApZo26NnChDR1/Bd45toLodT0asyU=;
        b=JMiCCbV2Jr5VrUS2zc8RJmPBdfTaRBqCe+0GvE0S9Tw1Ja6DM3QV2mVX65Vr8ypBfc
         IpZkAwSi+NfYWq2/1Pz1PNNFOg95d0fAb0VCS9z6Dp1PNAOT1i+rmrXJiCKZZbGro59s
         EIDywUHaSLDss6z/lQ6SB5USmFBff/jltyJEqzIZrBgl32x7VIbbkgMxez9yQ3Kfof8b
         3Vopjaejsz4boap+gq3F0/FfqjJpGgFS4uS9iUNEzplUH9YTzTiIRcraqmNNnOIC2UcV
         wBDZVOQ9R/2Uh6r5ZQ8HYy0Kjolbk1Wj7H1gNVEee8KeN/4PnkSnXE0Ant1rHGk2HbMW
         jJTw==
X-Forwarded-Encrypted: i=1; AJvYcCUDbV2lhDZB5dcUi7Yjaq9EtgxKeRNk+WmEU5YcDeLB33YZixxj1ASMn4+WH11A6ngnTxIcFW5jlBz27iE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmiG8nPiSkSGrg/Y7+vxvINv4yyOM2qyD2A/inilmqLYCZmKAs
	DhUf4R5+fuyFdBbV//JhEfiCBfgbChHrEYBzKMjLILtKXiBFUL55c2Xi3OtsCEs5BaGb9Lj3ZC0
	aNzkOCg==
X-Google-Smtp-Source: AGHT+IEV92su1J2FY7uaurf5ZO9t52XY9fbzVwejKAag68BmYWgIrp0msEAIXf8QG/7DqssyzRiYV3a0Mueq
X-Received: from plblc14.prod.google.com ([2002:a17:902:fa8e:b0:216:353c:e7cd])
 (user=chharry job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ebc8:b0:21f:4c8b:c511
 with SMTP id d9443c01a7336-21f4e726112mr223069015ad.33.1739183568148; Mon, 10
 Feb 2025 02:32:48 -0800 (PST)
Date: Mon, 10 Feb 2025 18:32:26 +0800
In-Reply-To: <20250210183224.v3.1.If6f14aa2512336173a53fc3552756cd8a332b0a3@changeid>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250210183224.v3.1.If6f14aa2512336173a53fc3552756cd8a332b0a3@changeid>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250210103244.646150-1-chharry@google.com>
Subject: [PATCH v3 3/3] Bluetooth: Add ABI doc for sysfs isoc_alt
From: Hsin-chen Chuang <chharry@google.com>
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Cc: chromeos-bluetooth-upstreaming@chromium.org, 
	Hsin-chen Chuang <chharry@chromium.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Hsin-chen Chuang <chharry@chromium.org>

The functionality was completed in commit 5e5c3898ef49 ("Bluetooth: Fix
possible race with userspace of sysfs isoc_alt")

Fixes: 5e5c3898ef49 ("Bluetooth: Fix possible race with userspace of sysfs isoc_alt")
Signed-off-by: Hsin-chen Chuang <chharry@chromium.org>
---

(no changes since v1)

 Documentation/ABI/stable/sysfs-class-bluetooth | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-class-bluetooth b/Documentation/ABI/stable/sysfs-class-bluetooth
index 36be02471174..1168e0318e35 100644
--- a/Documentation/ABI/stable/sysfs-class-bluetooth
+++ b/Documentation/ABI/stable/sysfs-class-bluetooth
@@ -7,3 +7,15 @@ Description: 	This write-only attribute allows users to trigger the vendor reset
 		The reset may or may not be done through the device transport
 		(e.g., UART/USB), and can also be done through an out-of-band
 		approach such as GPIO.
+
+What:		/sys/class/bluetooth/hci<index>/isoc_alt
+Date:		10-Feb-2025
+KernelVersion:	6.13
+Contact:	linux-bluetooth@vger.kernel.org
+Description:	This attribute allows users to configure the USB Alternate setting
+		for the specific HCI device. Reading this attribute returns the
+		current setting, and writing any supported numbers would change
+		the setting. See the USB Alternate setting definition in Bluetooth
+		core spec 5, vol 4, part B, table 2.1.
+		If the data is not a valid number, the write fails with -EINVAL.
+		The other failures are vendor specific.
-- 
2.48.1.502.g6dc24dfdaf-goog

