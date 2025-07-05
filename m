Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA845383
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751685024; cv=none; b=JZUakUzkXOCVzNlg8tW4J92Su5wyDS6MA9xvQB0i8YDp2DzjYciAo3Xn2kE5aQKpyN81GbTx+3TNj/ydZygmku874NWTqWydFRDo6KNm8Bj+CvcqQL1SFFMLs4LLPza1e5Cfm7Wxan8rG6wl2krg3eM4iARpPJJJqGRbwHJUjkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751685024; c=relaxed/simple;
	bh=ZjJgMQFyNrZzdsS+RSF6aCHsO07P93MdMB3Y3/o7dOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Mygy/JC/P2L59srEVL1+2vTVRPmcFBeKD2Je7Ph9CYgmQER9sultaijp6V5ArSRPDNqwmDVowL/ZVDkrCDCXSTIm3wwkDgpNcXdhzI5pRRTcOfKDOJR4e3OmZD8wj5GbGseS73VKntrgyuG4Jvb50+TnUr6cq3uU6jTz3PEEZ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPNLCBgP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPNLCBgP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1395174b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 20:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751685023; x=1752289823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FhprbhnNwO5KTye6Osi7P46BwhU5kJvDIfzKK1WNeQg=;
        b=FPNLCBgPM/xNF+IM8JFQ+JfdnLxHIZmAxSEug8ihLsxplcO/ZN0x+BDnjQRVPFG5ru
         hJTRKGPNdT/7fYp9fgABXyz2oYCsSRvTdyKStx14MhSJzwePaGXhuXocx+zYLkRsWAmI
         cuYJYf23+Wzl3UZrXf4QUPi6aCOMM4dbsi7Bx8c6LDoSkc4xhG9sCKEQlvfzgGObruST
         gVWKxHBZtYqKxnHg1oTDsZ4GacyyA3X/JM3TP6FvRSBlqWXmzfox0eGkULya6kUSKxBl
         fEE2vEwFSTE7IJU0ufk9JXaPEqe8tDipf0hN9ejiTn1TiK9L9Ej4sAWUdWtzflE2os7O
         QX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751685023; x=1752289823;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhprbhnNwO5KTye6Osi7P46BwhU5kJvDIfzKK1WNeQg=;
        b=YAbStgPsWK2/+cEKn/L8ckeO5PXe2SOnaQYDq9dpdXQkd0yfIvj4a/EBHniixVULEK
         /Tdh8GKTQHzrzIfwhKBMSdG/4dj62oq+one10zcEdUBipb/FCyHbUtoF8AAseDxaRyS9
         DkIoElicvxzZqZYioTJYC6MlBcQlbwjHzjMGVvNWDB5dz75MjJIPU0M1mU97Q08/cTUC
         nEDbACck4lvYu6i43kBuvIFkbmzAWAGBiK0CJUba/yp5280WqlHQ9UbltQTcPy1ZPHnZ
         dObRG/LpG3E3GYPxLCDW1i0SJXaBHNyF6mQK9fAwsnSjaHzVH15xubeoR15YMORlIi94
         +tMw==
X-Forwarded-Encrypted: i=1; AJvYcCU53ATOv+sr3x9LtTzK+1Au86cHGyY06dx+/jUYPWP/3//yyddMIXSJybIdh3u13lxEVh0LvhtD+P1BxMs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Je/06Q/vvdwF0kOpm6srFvPqHfZtZqu+Rjx6lTCHtWzdpmZx
	flyHj2BTN7UqJW7SE6bwQPSxvd874l+SiAmFopOKWTQlSSTcC4wBo3tVjkvqDCl5
X-Gm-Gg: ASbGncu2u5ewF1rzL3UcY2eNhNiGTsOxG2eLMG7f7wZ/I3YONfdS8JZylXUYuH9F1Hu
	gOg0dgozTEqAXcr2fy2kFRXxfgXLs0Z8eyRyWGDsuj4iV8JduCvKF4rQKfuOLy4QyCwjYJ50lVz
	CYvmIt9JxuMOGW57wmMPPTAxx6AW+cIa1GspGEnnr64SI+1QpV+O4HUg6QDL4XtgWYg9GOToVe1
	mHDbOO3ydeBeZjTc38lPHp8YV8qhDyrMOwEVHAf4zS1tbMuMot2n9OR1zh7sMxc93bJoiC5d2Sz
	4UdtUKhf4FAvEgCV2DSpGqKAaYI6XZMnNeEuYEt6yoFvwTQ7tfZnK9evfwl9RzT02TyJC305TbK
	n38zFevXtckzx
X-Google-Smtp-Source: AGHT+IFfclANFM9UijQb+OYY4U9NHnUmKPQYEpF0095W7aQdDHXQugExwMSHYEua00FTfcZXySjnXw==
X-Received: by 2002:a05:6a20:7295:b0:222:d7fb:d465 with SMTP id adf61e73a8af0-2271f1c6009mr1304634637.12.1751685022610;
        Fri, 04 Jul 2025 20:10:22 -0700 (PDT)
Received: from ipravd-Nitro-AN515-55 ([2601:646:a000:5fc0:fe05:9daf:d0f0:426d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f32c1sm3182402a12.48.2025.07.04.20.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 20:10:22 -0700 (PDT)
Date: Fri, 4 Jul 2025 23:10:20 -0400
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com
Cc: ipravdin.official@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ocfs2?] possible deadlock in __ocfs2_flush_truncate_log
Message-ID: <tcgpo4362fun5lfqbioewmnnoocpt7ryeezthhc4bfzagpw75n@t5cg6himsvmw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6868969a.a70a0220.29cf51.002d.GAE@google.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/fs/ocfs2/move_extents.c b/fs/ocfs2/move_extents.c
index 369c7d27befd..ab460cb2c9c8 100644
--- a/fs/ocfs2/move_extents.c
+++ b/fs/ocfs2/move_extents.c
@@ -617,6 +617,8 @@ static int ocfs2_move_extent(struct ocfs2_move_extents_context *context,
         */
        credits += OCFS2_INODE_UPDATE_CREDITS + 1;

+       inode_lock(tl_inode);
+
        /*
         * ocfs2_move_extent() didn't reserve any clusters in lock_allocators()
         * logic, while we still need to lock the global_bitmap.
@@ -637,8 +639,6 @@ static int ocfs2_move_extent(struct ocfs2_move_extents_context *context,
                goto out_unlock_gb_mutex;
        }

-       inode_lock(tl_inode);
-
        handle = ocfs2_start_trans(osb, credits);
        if (IS_ERR(handle)) {
                ret = PTR_ERR(handle);

	Ivan Pravdin
