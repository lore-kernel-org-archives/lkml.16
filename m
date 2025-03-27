Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E56D528
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743038903; cv=none; b=NCg8ySMR+6xYgyULlh8wLVekCobOZtsf4DrjEClNtQbbvD3mFurMO4B1DMZOUMPpAVvtm6b6g6+YUs1Ylg/G9+IxXmIrCPvZc7Kdn2Z4tyNOtqI3RXFyWwezX13Qx1CNFpPYsMeiruE/KGkT0b7J5H/7xR+kc7Q8FcFLBb6QgZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743038903; c=relaxed/simple;
	bh=bvHx/SE2U9341Bzfxkv/EgdgJyqMRjNX4+366c5RX10=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CAuGOpVfJW0+fmulsaW9QmIJEZvYAlKQCp9hPsXTaUC6G67GeHfC76ndLAGUcWRZamsmJGHVupPBA59gZN84bI9E4sFGAcjvuNTVwZIiDGkqDorR9PFZjUlf0lZ/8LLAG6a+z1alC+IDA1kQ7qrJi7yotP6AWtHMIKCXV0DWjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-851a991cf8bso145172939f.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 18:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743038901; x=1743643701;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vHTrB1I1FZlDj7IC3v1xQb7JeTtIJrlMPY7rxcNIQs=;
        b=cbfnxwc5Gd98irDJ/X9kq1CCY9lxNP8Om8V4oLJcR5HsEQ4FSd4fxq5W/c7ICcOGNW
         LU+zzn0yY3/IDWyRkkNRlyXvVp0y2Rvj56MDYIa7ob6IFaa47OEoGjmcDipuKzEwHv7y
         L0AAid4mn3+4A/jiCWaFGr8wynhf4nDF3rgIAhekBw/Prf8KbOAGAlHB9drS73ZmMO3f
         QtviI2m2vc+prxEvUv1HHMWPe91L1PpDDTzLvcoiZv7if7WFjrUFnUZORh7XMbpnLrYb
         yxHg0T5SJvQVuJvDQ+wRJ1I29ocmWq1k7k3GOjpJl+VcjkBBT5OPBh+0JWp4t9Ry/GCr
         UURw==
X-Gm-Message-State: AOJu0YxtNAARyTT0tkKdIDFWMDQgqmP/ehES6zqFxFrJMVUK/sz661hV
	Xm0Y2Weg1vrcLNnHPE2djPdpFFjT0YcASmuaA9lmGoMJTrm8g7K0npOL/4UIUH84CuH+a31VgTo
	2eXXHMki1BoprCPjtueU+ft/AhD+TeWCSENny58jPEX5INDRXi0W3cvo=
X-Google-Smtp-Source: AGHT+IEOaan2BJYfP6wAVcVnZ0hPXD4qfQB4x5GOFouhVsJPwKKiFCn8d4eC62gQt9cS60SitSAvTnsan1gIh1+dB9UJ3yg4hsV4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4401:10b0:3d2:af0b:6e2a with SMTP id
 e9e14a558f8ab-3d5c2179d5emr49042625ab.5.1743038900958; Wed, 26 Mar 2025
 18:28:20 -0700 (PDT)
Date: Wed, 26 Mar 2025 18:28:20 -0700
In-Reply-To: <67e46af0.050a0220.2f068f.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e4a9b4.050a0220.2f068f.0018.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [can?] [usb?] KASAN: slab-out-of-bounds
 Read in ucan_probe
From: syzbot <syzbot+79340d79a8ed013a2313@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [can?] [usb?] KASAN: slab-out-of-bounds Read in ucan_probe
Author: lizhi.xu@windriver.com

#syz test

diff --git a/drivers/net/can/usb/ucan.c b/drivers/net/can/usb/ucan.c
index 39a63b731..97c6cfa2d 100644
--- a/drivers/net/can/usb/ucan.c
+++ b/drivers/net/can/usb/ucan.c
@@ -1399,7 +1399,7 @@ static int ucan_probe(struct usb_interface *intf,
 
 	/* Prepare Memory for control transfers */
 	ctl_msg_buffer = devm_kzalloc(&udev->dev,
-				      sizeof(union ucan_ctl_payload),
+				      sizeof(union ucan_ctl_payload) + 1,
 				      GFP_KERNEL);
 	if (!ctl_msg_buffer) {
 		dev_err(&udev->dev,
