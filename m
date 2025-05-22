Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0379D136988
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938413; cv=none; b=dB6mcilWNlqxo3jpdf1gbdEEoY0XqKEXGxc0HXnfk6W6Fgm51/Xw1+g7j49lGnzAEY13PzDky6Zj3bvtVICieKFwgkpVtD22gw0fKKZV/RkDYgDdvNQeMgJy9445D/LcptO4mVHGlXz2dKdf6TM72V1LMLAhUMfecuWqXZ3Bvow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938413; c=relaxed/simple;
	bh=7WkdCSN7jngRFBXaRRwOSRVyIcEHgzMW2sAzcGN1/7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MbtCZvLjTHlh+ZH8idYnf52YEwOfEvC58XQJXfcS2NPq+xv1iSmulu0R2eq1yArVVzaxl1o+sY/lG8RAi8e3FWN/KVJ2lZwFcMgcJCESu87d3Vl8IwT/8SjYyhXToTvH/ZJI6guYS819Ecz9HPGFSEzL+rPm79B50A8CrJHcuVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhME2m3F; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhME2m3F"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736c277331eso147842b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747938411; x=1748543211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2K2QIVS99mHYrAj/FvKpKS0oerqBU4OZaRtyPiB5lEI=;
        b=XhME2m3FNXADWuU0j1YCgsgCgbo4IkFT71UhbOoaqGYp10UzqZM/q/+wWTANuiIffT
         No2GkEA88EV+LL4T+VthoJDnSrxLHtv4lJ4PPL5ZcDaDgDSajvbykWh/JCtosiv0lcrp
         Pt+bEc2B5H8vTDTA7+F0nlDPQEQ4S98Hq60xt+gdK43yD8C54rPLNODYMOUYqbwbY79o
         IbWiw65L4LofstF3+aYyAHHLvdtf6UgMWle3NDtxJQAYPRGYZ1Z/RgpYDbKNpcfmDRKc
         NLAnJbg8lLobHEFBioejsO1RDVsNSuGdhcLYPt1kNLkHvVhCtguqU3Ple6XYvoJYKUVW
         OHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938411; x=1748543211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2K2QIVS99mHYrAj/FvKpKS0oerqBU4OZaRtyPiB5lEI=;
        b=xM6sGi8f474+gC/ePvJGFsli1X6Ulk2rCjm7ZS+FQK/95O/EjcZXgldHKO2v4sfyo2
         YzDGckY1mfcxYNDLhXjC3oZumAT2w3yD0F2wfi/FLfWrT0RT19rGLkXdBf03Pmq/m98d
         67VT0cGSUTMT360Iczk64gzdjtTfjxv2Wms5YgnAygtlR9MhIvU+uMWaGPBbzGyprdEa
         YF90b/TaPtWg7sRdRD4vWu3vsjIseEb7HDLj7lld+d3UvN1fnQhhZkCUJQUyLtTVVg+Z
         edgIHCgObOIvNS3yPiD4SBp4IakRhyTdzMUwAlYHpGHaMC0VQbDRuEt4DzaZKmLsHtc3
         /IUA==
X-Gm-Message-State: AOJu0YwkIGLliBFB5c9aDdxycef/5KkRG41S7LCR/0uITtP+mHTUOxz2
	pKukqswEARk1UN4vjfhYsifmmIrT4BlgyMwxsWPQP6NDEPcq5mbdHvsPIPZxHQ==
X-Gm-Gg: ASbGnctrDUdSPB372ln4SHfMCEh7EefQK/BPjYEHopx3aP8pnxWaKvqPPcc1ikzonQI
	QC69s4fSJOf+L6wW8kRrYfYe3Jg73SeqaotRBOqJAF5lnshKhg3jN9qaWmGPNzL9d1j/qh9U0gj
	AoSzbqtXwK0D7MMowaf8wV6jfih4zDotLn2aZ/zbgoTX3+9cmzl21UOkG/JfjywDdzUZJY1jm4S
	UAOXMa6mRNusduDho/JX60q99lygsabfzb0ntMDj3QB5mOCbIJVNNPiYOrP4FFBJ/RSQ+sgBH5C
	hVEAcdftj9sQ+eBRb6WXu12L64s0hLecfXGBE64u9z7+IcQERciA74MqWO52oRoa0wO+jElhOx+
	nDcM0vAdUdsCGbmpnk9f/eBP5GZvaegHnUiETSehlx9A=
X-Google-Smtp-Source: AGHT+IEh2ADohNRqeXlFfITgVLoWV5fRFAHgFet8g4ue+tsRIJm2qGxJYt4lOr5PR1UH9cOcPo7YOA==
X-Received: by 2002:a17:90a:e7c4:b0:310:7486:d60b with SMTP id 98e67ed59e1d1-310e89008f4mr650636a91.14.1747938411036;
        Thu, 22 May 2025 11:26:51 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:8127:b563:a3a1:d465])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-310cec3f320sm1348049a91.9.2025.05.22.11.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:26:50 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2] mkfs.f2fs: ensure zone size is equal or bigger than segment size
Date: Thu, 22 May 2025 11:26:44 -0700
Message-ID: <20250522182644.2176645-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Otherwise, it doesn't work with a crash.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: relocate the code
---
 lib/libf2fs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index d2579d7..148dc12 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1347,6 +1347,11 @@ int f2fs_get_f2fs_info(void)
 			}
 			c.zone_blocks = c.devices[i].zone_blocks;
 		}
+		if (c.zone_blocks < DEFAULT_BLOCKS_PER_SEGMENT) {
+			MSG(0, "\tError: zone size should not be less "
+				"than segment size\n");
+			return -1;
+		}
 
 		/*
 		 * Align sections to the device zone size and align F2FS zones
-- 
2.49.0.1151.ga128411c76-goog

