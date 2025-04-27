Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089E6F9D6
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745782249; cv=none; b=HWJLfl+kVpph5YPRZG1fQxeoQ2Z/i1mx2Jwi54j3FmY8KPM7YKhIXUH/ldPO/tvwyXQYkvcy1MI3EBsU8MxJlQ2J9g+odr95qO72JkfUxHz3Kn4eZvUATAz+p0zxRhtb/F7PsQQFd8oXiSbd6RiBw/dY/DnmKEbblzLPBqoS/Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745782249; c=relaxed/simple;
	bh=P2TDAF9UrLBM44fuI+cfaoyc2CtBcf2/y1/ZSQhqPws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IhlCjQqk3f+S0oJz+7hn59Ge0mjiGQnEHX5rWaMNXhf28zTEiy5HIKh9YFfPoVnhh6i8TODSh27wGuSRmuSEaZqjCuURxK9k0nO9Vb/bjZZ+jzBl9OXZ8I5obqAp/xKhlHMd0HdOjkvB79iPALvV7LRqCDyGPIWV0ZAJNT2xEgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MToZh077; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MToZh077"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2963dc379so580300966b.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745782246; x=1746387046; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vq2NZtyVOEuDGpHaesgQUonw0VF6mQCOOpBxn+1+3Tk=;
        b=MToZh077UTzRmEx39yOQ3eVLp5wD5CkwUl3dYaoZjoOBYWDV7Vz6PCkELQ8H05xmll
         Kp0Sg1vmFoOptRgf8ZXPo11jVV/rScSmuY8Cif81nUquNWDB6ZJSnP5ciLlN8d1Vncl/
         EEMnJP0o0pCNSYaI+/ZboqgbRTJmUo4xY8YXwGxyPMsIqIItitj/7BA7MvLqpubpV24/
         TatRCSMTQO2/ougjd3Kfg2UmkI9a4SG4imYEaSn8oJOj/Pg+cjn14nOPvRkeKhWCfrA7
         VMTj42C7OWa0N3xrRid0JYDeEVZOyyRRrOg51AEtBJptQxui7Q6t9kWkFMyQL5q0dqBe
         Gecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745782246; x=1746387046;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vq2NZtyVOEuDGpHaesgQUonw0VF6mQCOOpBxn+1+3Tk=;
        b=SY+mRoizGdxGWqrXBkWajEfp1jLxZ1PA1mLuqY95BzdyVsM0p/a6AokwWslyG70o1J
         m8I1FWtulAXlDNcRuQjES9Gh+/PpmoGkBScqaccEOUCNV0yKTdmwSnAL96ZIxTM7wcwA
         dbuiiu5qBOTiwL14Lk/ADqNL3Xzb5Khwje2Bc21OaZuCrdEVVvirgU4oT04HmFqe5B3c
         BVFNl5fP29csnIPWmpCwW4uvRFZFio2A4OMcP8P3bWF8WF+6x9hkSoFO1LUkUHqyq+lY
         WrYsooYYvNXItVG4Tp4J4ilqUW66wKfsprgaTzVFc3AuULt791+EVxNPW/jaz9Xhnjl5
         CrBw==
X-Forwarded-Encrypted: i=1; AJvYcCUXxVLAf9gRWZso+NgSE4wpEQDFh+NkvI6StziaBXuVqKhTYsFwxtKMbqRZBevpHA62347u+jwdTfnRAfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDjIoUZK88EV5G7zsgKmHL2IhXDNLq/U2F1YXk9j1HZbzFrzt9
	nvuliQmKmLnmtp4c+1kwV6dMFQ2w/iD46/pYkA9KIo6IpwFuEGjV
X-Gm-Gg: ASbGncul1uYLgiSiiocFXnsSbFwsHg92dOtzhJ/hgQTJ1t7l9TDXyR9wfRtsLFJhB0H
	FcvEDIqwBVwIui9KXCYYWS8A2LfLATEvBqnLn0+sUEmDErUgC2FS1ZzJyBckWCtQEPc07vJNfod
	Smvv7JWSRKqcQazClpUP2bB5g3T1Pb3voDMEJLKS1cm+KIJyDpZgBjInhKIL8cFitEG2ZI5d53C
	9pdC6jEhMtOW9Qrg5sH4pGy+kfNystY+lQTbMKVf6F+9GkfHPN6L5hkfVvdquRfqwzlYVeeKYE0
	4XFJS/sJnig1GI0FX5fMolVIPlED2VyxAgA4ZRi/
X-Google-Smtp-Source: AGHT+IFqrHYYNndTHBqETij9GGWRLa1eTwCtVYc0JJoktW+J8p6FM13VUwFnm78bj89E7k/qB+FIsg==
X-Received: by 2002:a17:906:f5a4:b0:acb:b3ee:fb9b with SMTP id a640c23a62f3a-ace848c0153mr529006266b.1.1745782246038;
        Sun, 27 Apr 2025 12:30:46 -0700 (PDT)
Received: from pc ([165.51.118.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edae042sm486027866b.169.2025.04.27.12.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 12:30:45 -0700 (PDT)
Date: Sun, 27 Apr 2025 20:30:42 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] drm: i915: gt: replace __ATTR() with __ATTR_RO()
Message-ID: <aA6F4mbg_sfGRXzh@pc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace __ATTR() with __ATTR_RO() to make code cleaner.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpu/drm/i915/gt/sysfs_engines.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index aab2759067d2..f6149167de05 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -27,8 +27,7 @@ name_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 	return sysfs_emit(buf, "%s\n", kobj_to_engine(kobj)->name);
 }
 
-static const struct kobj_attribute name_attr =
-__ATTR(name, 0444, name_show, NULL);
+static const struct kobj_attribute name_attr = __ATTR_RO(name);
 
 static ssize_t
 class_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
-- 
2.43.0

