Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658951DED42
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148619; cv=none; b=aMSXvJFA6IyBOwNRSSZU22O4tcOuQ84xsx3Wp541cvTl1oAmVuJNFdCWRfQSdRUip1exHJqZoQ8Hj11UdPz4nm2B0IYo6m1syyTnvCQ9mczRdVuOtR4/WyAybftnZ4b6fP4Th0oMmKPyCiVKWmUtRa2XABJwZvuY/5uU5HZ7Pgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148619; c=relaxed/simple;
	bh=3eb7PyfQipYAH2mOClQzUmK9oJ1sipNCNGsvmnU+0/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOOBVW/tcOE8DidJBKFncvxPHSfMWo4vf2NmSp2nxETHLXH/88NvM+vDwdM1NRsn0+kb/Y/XoAQlAEvy1PNrsfSdEALrBauerESaR5IY6O9KKHkLavoEl9yITW86oUNfA+l6M6EFRmUp6sx4sg/OrdIMBiFh8AHYiOccckdaejA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=aoCmLwoF; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="aoCmLwoF"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so5875635e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1747148616; x=1747753416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGJIs2TI0njjS/7dQefh5772Uvy+I7f3u0bLm0mKqKA=;
        b=aoCmLwoF/rssH1HZXPZp2yuHef2FLKWDU8tpuXri5oh5N1KTuTtvP0a8M800YW15hQ
         BcuES91ITfXeKFBKrABqPVpBPPOoSFTOZab9s1KYqPanJL2B/EleJSZvFoBPUmAUFCyS
         wLNKqmvnXpOdwWMRJ7CKcTHOdhYl12zKejsGMt/4Z9VYyYtXTenPAlW04NlpsWSVbqG0
         07VtulBq1UiuebDLsac23z03zq9fk3MgmTMFrnHwaPWOSfVkgwndfhnll7BH21jVHfo4
         3X8KW2T5yT0HyC5/4EEPzN7BVIpKfX7Dh7YroxefmVsO9TpM87SvWkL6q35OQcv97iQL
         XDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148616; x=1747753416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGJIs2TI0njjS/7dQefh5772Uvy+I7f3u0bLm0mKqKA=;
        b=STPg6zk88zixOdFAkve1spget0Gb2GW+Gn6bZ41ENIk2LkIl8M6Uwr408LUdVCG8DR
         IFggBySkiTo+c+dQbZMAZUmWI0L1czCl82Jb2bMyqEvLr/5ovipbvv8vBH1FZig5YrOr
         YhzSJNTTxojxptsMx6RW9bzvVO9wslfyacSzAekRZ4nKXhB9iHIyFR7VQimxX3jOTy73
         X/O3ACw96NjNjFZupt1CZACimJ7G+O+JbZV9FXF1kwGl2gIUVwnBvDb3gBZRhYGDK8i1
         haH1GfxAw6BpYPa1q63Y8k3hxeIbcKthDq5MqQWtgvAJm4yLybK04wUxQgkerxhLsP8A
         PzBA==
X-Forwarded-Encrypted: i=1; AJvYcCXdqCJRSt43X8zNNqveh0ZldAR1VsQqQZ9cZZi8ncoXT4gGWsDO/uDWw8J2dH0WerBkv6I+vViH9tzLy5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPk/qKA5Wzhp0cxYEU4kQpLwcw4+3e03Z0H94cbWX8vi7JEFwS
	Ou813NwU7shNh2fQV53HDeRtluGJ36WWAsz2ZMeOLRZi7mYS7e77eNHObPsZdYE=
X-Gm-Gg: ASbGnctBsoh2pSqYuBIURl/Rx4RMmQc4pdhKDJHEti09lx03HSrP/UasnZSdXwhDUdk
	mOjSdsMRe8xmjdnNtDK4LPRadx0+NuSjGpex94RBa30C6T7HoD3dsZK1V9XMfRwLdzF+yNpckn/
	YPSP7WxeOLY0TuW5Yordl8CpN4aHFkwC9qLJ07lYJvcYv1GIcVBXPvMhsbC1LUJ/seP3wPooesd
	GK1x2f+x0DsbOTlFmp9pQ5xLWzOvi4k5O24hvRw5b8lEm+6FQ0fJR6/I+p2KriXOuEHMwZHLbyO
	Y0VHE9K39k/nFiaIJKXVXS6XyM52gUDySIIml46m0uPRD9ZYBI3bAk478a6JDPOM4qrOWmCRo2W
	dX+UZpqw/mN+u+ibiKfOf2Sqj5VO2eXNbMKRlXTR8en347G2KKXU=
X-Google-Smtp-Source: AGHT+IGbtsokICQNCqwJVgLywlMX6ZnMt2bLgm7dktJCKAmrvUn7dVbybhKncQSFP+L0Faqk1cEhFA==
X-Received: by 2002:a05:600c:8212:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-442d6de0e29mr181541005e9.31.1747148615543;
        Tue, 13 May 2025 08:03:35 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bc2fsm106800805e9.20.2025.05.13.08.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:03:34 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 2/4] fs/open: make chmod_common() and chown_common() killable
Date: Tue, 13 May 2025 17:03:25 +0200
Message-ID: <20250513150327.1373061-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250513150327.1373061-1-max.kellermann@ionos.com>
References: <20250513150327.1373061-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows killing processes that are waiting for the inode lock.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
v2: split into separate patches

This part was reviewed by Christian Brauner here:
 https://lore.kernel.org/linux-fsdevel/20250512-unrat-kapital-2122d3777c5d@brauner/

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/open.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/open.c b/fs/open.c
index a9063cca9911..d2f2df52c458 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -635,7 +635,9 @@ int chmod_common(const struct path *path, umode_t mode)
 	if (error)
 		return error;
 retry_deleg:
-	inode_lock(inode);
+	error = inode_lock_killable(inode);
+	if (error)
+		goto out_mnt_unlock;
 	error = security_path_chmod(path, mode);
 	if (error)
 		goto out_unlock;
@@ -650,6 +652,7 @@ int chmod_common(const struct path *path, umode_t mode)
 		if (!error)
 			goto retry_deleg;
 	}
+out_mnt_unlock:
 	mnt_drop_write(path->mnt);
 	return error;
 }
@@ -769,7 +772,9 @@ int chown_common(const struct path *path, uid_t user, gid_t group)
 		return -EINVAL;
 	if ((group != (gid_t)-1) && !setattr_vfsgid(&newattrs, gid))
 		return -EINVAL;
-	inode_lock(inode);
+	error = inode_lock_killable(inode);
+	if (error)
+		return error;
 	if (!S_ISDIR(inode->i_mode))
 		newattrs.ia_valid |= ATTR_KILL_SUID | ATTR_KILL_PRIV |
 				     setattr_should_drop_sgid(idmap, inode);
-- 
2.47.2

