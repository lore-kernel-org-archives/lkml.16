Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9350C347C7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148621; cv=none; b=WzHWfPhhnFfdM966giOHZRRjWuWeHmgu2Y0r2FE0rz0JRoAcNtypivObUUgsiJ0rJni81b471g7+8skqhv5865rgkeTozukEwVkF2hFSTsz0QpD6RSEsCtfdgiyJq29tdt8wF4LMIjg7LWLPGCt85k9PYeOZy4lKYUUYLCR3uJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148621; c=relaxed/simple;
	bh=PMgcI+gzWNBZdH84wqXv0h46FvJNnnr9jLaGVUU+pnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DST/zQgOmNRisaYOX/wY23310/sP+3riXrmfpOkcF/SMgr12KNDy23/mwTeG1Nii3xg7I2O7/6M0Dyn6v5uW9ZSz0703M5Yc4bNoAfbqhsoYrmM+0Vh5dq+3sPo7orXKbJxTYNyNGtxUf9uo1HK/L0LIeo0isgKUJcrLtJd+L44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=KbPxyJf/; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="KbPxyJf/"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so33308075e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1747148617; x=1747753417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWFGB/K+zig4Ure16KVPt1hrUDBz+TRZotq7diqgJ2M=;
        b=KbPxyJf/tDwNRrmCizrrUBPBe53d60IqH6Itu7hphHbOLF8gqdg5AUQt4cJ9o+q8oN
         vwjHBKAFgVoWAwfg0NZwg4XZ4KRFTSby5gcJwHgzN5WkVYVWNQruG4e50FLn9jXvKWl+
         ZnR8AANLYv60p6LKIEPWvN4tlsN1laxOO90aCEuats9vwf1qnjS1GPXpt7bnivr1sPBn
         7HZCUYalghg54pvyi+sT+Yx9ciFUs9mA3m+3/LEUXx+3znsvccUVMiw5WHZBg5HS/J4I
         gfXpea6J3NPH8awRvKhrPM0htT6GyOFgq9T4SZAlZtjXp94QxdNVmLytgTgMJgTggZL1
         mklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148617; x=1747753417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWFGB/K+zig4Ure16KVPt1hrUDBz+TRZotq7diqgJ2M=;
        b=K45wuqduCqLyccoKFaXjwEIegoyEoW0Mqo1yybbSs1si8Ra19FgGww/x9MLynQNOn0
         fzZRKzWVC6MRponvZjoxXTK3+HOoU2zAMvy60EwtF3rZeuHvrblFUXkgnzcppI82gIaa
         TXkF/noVKoQtwCpzYOZj4c4gjh315sT9hW0QKq3M/jAwfMAJcMJNt1CmohILhxhQvK1w
         D1Q6ipyRbkKd3d1rwHKCFspUONmgS3OBWsgA3A2f+ML1erzqezGmtUiZ8GKn5P9v59sv
         SoLq31JNR11kRJcTQOnqJs3wuMASvKQNOSLOtzyxeHB3cL09ITWXsYFxsHcZMVhqsuP0
         7FOw==
X-Forwarded-Encrypted: i=1; AJvYcCUA+k6VrIFM0VG5ULyklQAUTBoQ6AKfkM+68Yo7urc6ITVNmHAjvA0j5E+oKRPjAKM/39eiSbik7ptdcPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPnVKe6zUVSXIcc/FN8NpWKp74eyXMF/BZn2HR7H7PsZFP+lrt
	bTxWTQ8kTgg4xRRpec+izjkozZfWjenlVNqUVCcav0uz39N9p4hA5Co2JDln2Hk=
X-Gm-Gg: ASbGncsLtF0lrSaAyIILZxR11Fc0HjhmRSOmuCnuQvnmMJrwhFauFP4Kkx48P5rwVha
	utuMOS/AbnBL0naVQenw3AR8FL2MSl/tKd1aOKbEH+Ndrejz2Rp7BVUBUp08HLovz9NNwaiDZKN
	qOZ0OnMCiGVnNt/0Z5BWWNLc6pW7eIHmogxZQKT3Ue+LLdwjMfjTwpw0prAaIZpHAYTy/0JId17
	LZeoO/dVIMGJCxwopHRd2EXp41hb8PCASv1JI1PV5+mqv036dWGylOUsrTWEtzrnPiJ0REvgmDd
	82iS767XO23cmaZ18vFHM+n2uZg0I4Z1G4KKu+LHZA3jztS/MK2zgOU8kBCtVlXDw4aMvhF+pps
	scFdaKnRvpmSAlKoKWIcpx6rHpPPzFHxHJNS2w/zMk3NNpoEPejM=
X-Google-Smtp-Source: AGHT+IG0mWUuNxFzrWUI/GF4eUADxQbQomCRaJ5w8tGJbA+MKSqy/z8Nl9zpSz5XWu/bKLjdYI9vZA==
X-Received: by 2002:a05:600c:a112:b0:442:d9f2:df4c with SMTP id 5b1f17b1804b1-442d9f2eab3mr105883385e9.22.1747148616753;
        Tue, 13 May 2025 08:03:36 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bc2fsm106800805e9.20.2025.05.13.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:03:35 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 3/4] fs/open: make do_truncate() killable
Date: Tue, 13 May 2025 17:03:26 +0200
Message-ID: <20250513150327.1373061-3-max.kellermann@ionos.com>
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

Review here (though nothing about do_truncate()):
 https://lore.kernel.org/linux-fsdevel/20250512-unrat-kapital-2122d3777c5d@brauner/

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/open.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/open.c b/fs/open.c
index d2f2df52c458..7828234a7caa 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -60,7 +60,10 @@ int do_truncate(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (ret)
 		newattrs.ia_valid |= ret | ATTR_FORCE;
 
-	inode_lock(dentry->d_inode);
+	ret = inode_lock_killable(dentry->d_inode);
+	if (ret)
+		return ret;
+
 	/* Note any delegations or leases have already been broken: */
 	ret = notify_change(idmap, dentry, &newattrs, NULL);
 	inode_unlock(dentry->d_inode);
-- 
2.47.2

