Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D991DB15F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615740; cv=none; b=IU0D5uxC8Prsj8e8RcqxikPT+RgQ+R2/rueZwG9iMclsiy0yKnqigSR/ha29/NXnCRvhKC7QHsqlcbPalpEdBSNMNFXITyf7M8GUCMbLpL61jJWXaIiiiuUzE5yn8mxmTzqoAvf1xl9icaltCxlffZS2pQfR7QwXNp63Zyeeeaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615740; c=relaxed/simple;
	bh=WoRYA2tpLgnZuGnp9hThjLb61379Aly6hCsea4BFktM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5/0rA0msPHL/s51AMTQnzE58Vz6g2Zo35ew68GKhahrlCTy4+PbnkbnK7saZZoS2NXo4ecmy1tHpodxoQVhtCTZ97oWKwb+UnSFrVSv1qSeVf3NSVcnJqYDDmE33JELGPMYnGT25OKFNarYR1BPVIa+bWeyvIQLiMubic+Rzxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+a5rcEe; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+a5rcEe"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d5e43e4725so474645ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615738; x=1744220538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlpyI1Cbu0G4E1iYQnKaYcyXlhpWchDiOL6/URF3toQ=;
        b=d+a5rcEeahd3l0OK+gwzfi6yW3yYGjNwoNTwwDoCZmSu4fHj6umJjPpe9xQeGagiiO
         d6uwEtTxF3ISB2/VjoSAghtQWheuc81ZrGhtmZz6WvedHLP6jyMDmq0lLX3tOlXA5eJT
         8KqfI0Ukpci6vjU8iiINoaafHtL3GtN+uMCqEa+dfXfc2D0aMM/Nrocj42u5q0Xm52FF
         rfS/QdMci6ZKEJnKduOr1Jt3Zabi6X8I/Cv9ZnjVBmeB9IErouqchuehA4zrz8QopcIe
         WWd/X/uyb3POnDhgiADzySYS945STiS9mSuI7MqhG8avndMFdWyzMR55MZZlt8h9eBbB
         6CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615738; x=1744220538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlpyI1Cbu0G4E1iYQnKaYcyXlhpWchDiOL6/URF3toQ=;
        b=MaDW8yt6XF/oWp6otFVEXIGp7iNjhKroxWqRCiAeXWYh82misRmF+wQ12ETZeNVZC6
         XFrS2RfMCGBK/XEQEQeTGxkCqoIf5RAamGXhPAPsYLYCo7WCHc8+jMtOPgLdmYGvOG31
         pBnrfqnNuxUPITW2mQ+PMH+/gZXbZWfoCGUq9HKf3EvzjhZmyMCk6TZR2vWtntsXJClA
         8SDK6VdLVXoEAeWCPEdOSMRaqHLZz/BLbvSB9Q6bbARvQcoZm3YolUf1jCVlcgb83DnZ
         YMLnFuOE/IZZ5w14rpTJXdK1ZeoBzKkNaKA2pd020HnP7+NwXAbGT5l09mTDrIA1u7I2
         cNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKRle+ajLZ+xoraYTIj1Ja5UnmhUEgD1o/Vczp9nKpsR94X6ak04wr19pTdE4g0BOvTge3pN4k2PVqEkM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz48NUVv/JzQMGvLMYJzx1SbG9gZ0v8lMQuNkeCaSldA2S6ixW/
	kRzIPah2v8GmlgS3YBAlhXz8bNoBhuKUc/hJ+NxMVmD9HgZchR8/
X-Gm-Gg: ASbGncsqbY1UQA/WwjiUEIwhOotxfqTjxKfdTDbIZhSz3UXiu4g2dACGaFBbrHs+C1G
	fzECWmrSkASC3MPz04yLKM43YAcOBzxU81klCbzM8shOB3wROU6s+17oVnVr65/og99wvolaykn
	IfhMMRdli5G5iVL6Y2AgLIjqCiQ7GWLYFSsFjnWiP0qpA8158fiyoDbRdR1GQ2yu9Z3GCGOCdYD
	b8lE6E4rK+hCsX99tkAiLoTM5IlWocp0K4TVR+RuXv2b3EfnahmWPS7no2YVdZXjDLyVDrdhsi5
	YukeaqPIPG5fDbxUtmrqyoRtaiEeLkoP6uV81GmFG0lRj+b5b+NkTaEjqe+UIhVfzNReiGxGPBp
	ZWGh+7+aQkySG
X-Google-Smtp-Source: AGHT+IHHjhRDu+SE+n8jz0Z3ClAuEczfqEXMN4CVftbZdgfRPuFKsZB0dnMkVBgAMrRiDsGR5bLubQ==
X-Received: by 2002:a05:6e02:2703:b0:3d5:d743:8089 with SMTP id e9e14a558f8ab-3d6d548b160mr32428905ab.7.1743615738025;
        Wed, 02 Apr 2025 10:42:18 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 05/54] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Date: Wed,  2 Apr 2025 11:41:07 -0600
Message-ID: <20250402174156.1246171-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f2..147540c57154 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1154,7 +1154,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.49.0

