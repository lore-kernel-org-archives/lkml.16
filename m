Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9378BFF
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247540; cv=none; b=HVL97tjIJnpvtAZCICDiFH5/L3QviT+yeJI4hO3H2qtJOcNZV3auo3sDur4f79UYZvGjno3OS5VU8huRYAx7h1yvRSmnsBCHUTVxLZxB0g3DNyRIcQjBi+bPSn6DyhPBlRl0sKyrMhbFrMWbdsqLzH/5M0V6Ia6qKQiLTJtWtK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247540; c=relaxed/simple;
	bh=sA7asZK9ucRprwdIDQlSVHXLkerrhcndTmOGBsM3rV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dhQX3QWZi0b/hnWdUospY9/xuAZDnShZTiFYhBqYRvr524OgIvRNjI/U1RBaqAOvP/pYM6IN/sYbkrchffhjgtvrw7r57W6e9dieo+923hNH1m4tgcGc1dinLQVHccC7nsaS6KrixOqk6SISzP0w2XWFk50t2ropHevGNblYoRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2zEdZ2g; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2zEdZ2g"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-219f8263ae0so16377935ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738247537; x=1738852337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qvx3FpdL5oMIU/2IZipgSLR8aHKwTjhISv/FQnfDRk=;
        b=V2zEdZ2gKCphQbLlurGdaxPIRp6rjAnMM2URWTEB36pXIru7WNMNHvs/pm17om7goC
         IyzlTD+BgXiryx3kaGwRKug1L0GNxzvR5kIFzElRCBmf0Y8BYBOvHX82LKcLrBC8MmjF
         dhKP5HeiVBt07w4Pp3fiQFAB3zcI6Bm9sZvgcRyCDFc52oLprAAXpAQJ/Q8EICBBEp7g
         1H9HDJnE72Jg9Fj9qcHNAlKoypIdHqryCsl1BogzqXHDk/IeVj5wtkB9wUWcLfsQtfQU
         tX7H2XkuaaC/JrAq0PpAisfuplje/qL5Z2y8NwniHQiHVuIopqLkOmWbmravQcl5SIuh
         bkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247537; x=1738852337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qvx3FpdL5oMIU/2IZipgSLR8aHKwTjhISv/FQnfDRk=;
        b=hXFxZ97Ft3GdEymyRwS6h4McH85HL2IxKY1eWoyC4Pz1f8vNP0vlVz+vDsMPAupz37
         eQAPuhm4qp2wIUQ2eamP/sjuYEbd2scjdqEtG0gPNN5LVeZg/G5xnAHk50DgBj4VvKy3
         nYcJGIXUqmj9wjsc3Fq4Wj2vAQfWm+9YBj0tSZ8s1gMWOdAxjTJpyFL6MHhKwAUQEeUI
         h1PlC5NrL0h7BxYsTC1SvbPqRDixTeIy9MA8ppBEQd3w6E8SMhekOnWSYBWvd8VokBtV
         7n4FP3TFlz1IhpEdMy4sc546XuPPKU6tqIsiestCX8jibWqCpCOkTrQPBsUzaek+ooHW
         s0eg==
X-Gm-Message-State: AOJu0YyvXEDpRX3jfEQe8lh0BRHlvQf61vHmXFS3j/baf2M2llAohvYu
	STqvB8W5hQy4Pigdpep7aneCIl/xSR99HsmW4rwDJcQVd6USUhmP6uPwvOvF
X-Gm-Gg: ASbGncs78TRd4OqhhBXeLbBwUz7N2+IEXDeulmIcH9p+whoLolyxrEm+lTFROjnLIvV
	xBfqiM9kbl2nNcfHUx4Y2VhMq5pJFKu6B/kuZRl1XI7uR1TtW8fmqKz0olQhbYFzmzOzWi5K//l
	Xg9BIa2gEdd60H1K2pvpfRg95HUuKSLaMv1uzFqZZ9rcDBfDR1MR308oU9g10OuatZynanCOfTc
	NInInq+3R+C2RF2Yt1NcX7y35JpzZhwTtKZxXzoxlUrZQQIj0tPcGteQiKHFn/04tzCAg+bqGAQ
	dbGSiom0hy0xkocEMDciPO5icnH2IctnX2wz5g==
X-Google-Smtp-Source: AGHT+IE8c/vt2QdbZ2f5T200wHLHXYN4IpnyykL+38gCR+TZE2Z882J7JRKJG8r+myXOCnI0SUTICg==
X-Received: by 2002:a17:903:2343:b0:216:1ad4:d8fd with SMTP id d9443c01a7336-21dd7c4994amr88436165ad.8.1738247536332;
        Thu, 30 Jan 2025 06:32:16 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:170a:61d3:1c2c:a5df:6611:5aca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33200e7sm14690825ad.240.2025.01.30.06.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:32:15 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Cc: Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] grammatical correction as part of lfx mentee selection tasks
Date: Thu, 30 Jan 2025 20:02:05 +0530
Message-ID: <20250130143205.13564-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 tools/testing/selftests/net/reuseaddr_ports_exhausted.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
index 066efd30e294..7b9bf8a7bbe1 100644
--- a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
+++ b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
@@ -112,7 +112,7 @@ TEST(reuseaddr_ports_exhausted_reusable_same_euid)
 		ASSERT_NE(-1, fd[0]) TH_LOG("failed to bind.");
 
 		if (opts->reuseport[0] && opts->reuseport[1]) {
-			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets succeed to be listened.");
+			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets successfully listened.");
 		} else {
 			EXPECT_NE(-1, fd[1]) TH_LOG("should succeed to bind to connect to different destinations.");
 		}
-- 
2.47.1

