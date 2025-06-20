Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369135950
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382700; cv=none; b=VBssdR/MbGNQVyR2bKw+4HL4rWOTJF2/ZTlKo2twYRR1xzw0oSA0EnR0V5XSMewwRUoSphQ8g0Z3T158qoIo6p5zbbigUuEa9qRZMKJS5vrpWs15Lbr6cJuR/WXMqSLXBTwAHyWk24f+/NmK/kHsvAOJxsDY9wGpLKTGjssBvis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382700; c=relaxed/simple;
	bh=ZE6H1UsaemZuuFtMzSuGkSE5yaVJfmesBRedgaKkURA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YxObmX4K9k6WOSi2FPQiIaAdjnZYOMJrCigGVK2/4U+DtUGk78h+gClKtjDCXWQxestEQJnFj7H/+3jYzUEqop1tQUXrIfaU7TGRUy+ZjGXK68ABxPY4NP1ljdWC7pC1nPN0giMzBP/P8FJT6aS6mtdnnhTY65VFAzlp2JajGUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Wl5qVVaj; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Wl5qVVaj"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDAUu7024212
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=pps01;
 bh=GOxKSLo88/sXZwWQN7+1MNoBNEcUs8IGR6idhRWKuT4=;
 b=Wl5qVVajGyapEOBP/ZgYDieFsd7UvqoNRUOm0bpseTC3OM+CKNoaDul3A0QuQO6vJnmz
 TzFZhsnsZCsvk8O/AdfQVO2mrgVkto4l22ZM7YopRLvF8vY3mlOvrjGXJMXwkm5igrxk
 Esbu6SYWjtqkxxDTsgM144AsGcPz5+VqlsbzPwOxFb/Ba0uQYBCQTeyqVQG4jM4t0OZ5
 FauKl5ZaCCjFTFEQUbZw+ZtUDrachxlOwvnLrZKnJzAliHeXyNuJKO/QzSTPxMPjehCk
 DV8SrrOIZ0N4mWvX1Um87vUSGzl5VUph0pVgwAGKdJ0tEcUxjNKPtRuhBOi4kxI0fNxr 9w== 
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 479p7pqscr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:24:50 -0400
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a589edc51aso32440611cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750382690; x=1750987490;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOxKSLo88/sXZwWQN7+1MNoBNEcUs8IGR6idhRWKuT4=;
        b=xAdZ2CYJk5nNJiZbbMSHwtynX1l6Hx0r1xKt63QDBoJERO58r0oh9ueQObW7F0LzJf
         1EOACBSLycLbBwmCuun6WfGcBeiw6Gk/qscu5y9pE4yWGBd0uABXf6vEVyhEccIA9Pwl
         KztF81gFZRIXT7IgCDbKcoHLxtdaoosBy2t+HBN4mgJ4oJLwNDDbpQiDysMRyw2edlrV
         Yi2oj1j9LLDsYMXKDEggJD7VKyfWTBZrtwYVrQoMJUyCrmBHXVNo6+DnIxRimUi4hSct
         U/cZJqk0lw2Jzkk0898Em1kYu8G8IsrPB+SEUzxGr42E9Q8PkuUp+0HPqZzW/MRoPw0u
         2CLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5omyiCyxzVrrjVhLzbJAoeCGSy4rHdnLjWJmLUWA2ad20NENHQ/N7sQRgBYxkndeEfOu9/rGvCny6F9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxQuD7To5BGBhVa6PgcNhnS/vTpCCBm9hWouoIC17+HrdNNcE
	eST58yLcqrgtPQ2bt4gqimJgztHLjqyloGpshrRHorMRpsiM4TtZwBcP4BE5eqo6Nue9znhW/Ln
	YU8Lzy3ELHz38Iz7Iy4LLSxPfx7LQj2cOS5gw8OLcdLzxC5V25ncjr6hbvDplOw==
X-Gm-Gg: ASbGnctUBjgrAMnJbvhpBpYbmfrA5sleTB1WAanGMxL4XzH2Ibs5BefLNUAwyo5FtxC
	sB/KyPw1A3VTsi31C27LSDJOzAWa28KWJeh+zy/bKZKfnDzLlCmKzCUfk2rFcMLdqOY7Yl+kBb4
	aVKMZffV0bnonUi0McDkvumkunGZsuMxuQQZJ9NZtRoiQ4DH5hiMaVN6GVmKp3S104Dh851Tn3K
	QWLqLQrFuWF5yt5Zh20okDR0Lg5uh62fhEC205xypcIFv5xcj1ccPdrMhc/ngL+cV2t48TYeJNP
	5Sfg42tbgQwMjZHwEoZIKlo+rbJ2LJ8aA7Fx98Nfvo2A4OEL3NE+dndWGcq0JbxOBhC/
X-Received: by 2002:a05:622a:180b:b0:4a6:f416:48c8 with SMTP id d75a77b69052e-4a77a21e7a6mr19249481cf.23.1750382689872;
        Thu, 19 Jun 2025 18:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC9jHCGCp55sYm55ro7Kc20y+6lcgDMG8zlg8paNloPrfi/X7/VdzRZ4ySVIX6xJuzroxtdQ==
X-Received: by 2002:a05:622a:180b:b0:4a6:f416:48c8 with SMTP id d75a77b69052e-4a77a21e7a6mr19249191cf.23.1750382689454;
        Thu, 19 Jun 2025 18:24:49 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e79c12sm3794321cf.53.2025.06.19.18.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 18:24:49 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v3 0/4] mm: userfaultfd: assorted fixes and cleanups
Date: Thu, 19 Jun 2025 21:24:22 -0400
Message-Id: <20250619-uffd-fixes-v3-0-a7274d3bd5e4@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEa4VGgC/12MzQ7CIBAGX6XhLAbY/lhPvofxQGGxm2gxYImm6
 btL66V6nN1vZmIRA2Fkx2JiARNF8kMG2BXM9Hq4IiebmSmhKlGB5KNzljt6YeSyVACykxXWwLL
 wCLg+8v58ydxTfPrwXttJLtdvphawzSTJBW9NDQfTgBNlczL+Nt470nu0I1tKSW3t5sdW2QZor
 XbYauXwz57n+QNJ5y/i5QAAAA==
X-Change-ID: 20250531-uffd-fixes-142331b15e63
To: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        David Hildenbrand <david@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750382688; l=2062;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=ZE6H1UsaemZuuFtMzSuGkSE5yaVJfmesBRedgaKkURA=;
 b=h51Sumoe8WMQI0ow4ldHFipUTQo0+KGud2JGMHV3Z4Jp/FnieXctvfS3G6UIcUk8KBHKmttXs
 /uxZhxMsgciDp/5JmA2w18lXCk8p26Nd2DbvPPJsyobMopV4CLUTM+O
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwOCBTYWx0ZWRfX5jvkBAXMrZ7u jcfVzE2bUgvmzNHh3RjdxOuqpsfDmwY9oYHDsMF4YBFVpGUDFTxQHm63fYMIELNQLII3NQvasHa aQF6R5C587AyLXJ12JjYQ4TA3uWyAztCAg19UEdxjSpi2pd/pytLQYt3KVIDIdvg0JUhcM0chkS
 7mWkj5IjNMla5T7yHraqOK0A/F5CRE3vL4SqLUdvYsYTWM9w3/8yzjj7wPCeW6IT6tylQ93rgb0 /JifnJpyqIgleNx6JIPYsMUkPG9pJfrZAW0XheaBZ3HOVgJMA6ZGgC4ziEiSZAoJhzxqcOJPLVo ZWpe1NjfdMqaN5U5jWChHvjOMES1yvF+GYBDTxDqTCfFYGDEiF7tDp+M8Yi7DTZXjBZExMH8z7t A96gtdzu
X-Proofpoint-GUID: wDEqfMNvVlQqUNJNPs5eVMvVAf6cS1WN
X-Proofpoint-ORIG-GUID: wDEqfMNvVlQqUNJNPs5eVMvVAf6cS1WN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=10
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=10
 clxscore=1015 mlxlogscore=602 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2505160000 definitions=main-2506200008

Two fixes and two cleanups for userfaultfd.

Note that the third patch yields a small change in the ABI, but we seem
to have concluded that that's acceptable in this case.

---
Changes in v3:
- Propagate tags. (David, Jason)
- Move the uffd unregistration fixes patch before the
  VM_WARN_ON_ONCE() conversion patch, as per David.
- Update comments and commit message of 2/4, as per David.
- Update the commit message in 3/4 with more details about various
  conversions, as per David.
- Convert two additional WARN_ON()s in 3/4, as per David.
- Link to v2: https://lore.kernel.org/r/20250607-uffd-fixes-v2-0-339dafe9a2fe@columbia.edu

Changes in v2:
- Remove Pavel Emelyanov <xemul@parallels.com> from To: due to bouncing
  email.
- Propagate tags. (David, Peter)
- Add a patch converting userfaultfd BUG_ON()s to VM_WARN_ON_ONCE().
- Move the "different uffd" check in Patch 3 (prev. Patch 2) before the
  vma_can_userfault() check due to the wp_async bug, as per James.
- Change the added BUG_ON() in Patch 3 to a VM_WARN_ON_ONCE, as per
  James and David.
- Reorder the assertions in Patch 3 to simplify them and avoid the
  wp_async bug, as per James.
- Update the Patch 3 commit message to include more details, as per
  Peter.
- Link to v1: https://lore.kernel.org/r/20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu

---
Tal Zussman (4):
      userfaultfd: correctly prevent registering VM_DROPPABLE regions
      userfaultfd: prevent unregistering VMAs through a different userfaultfd
      userfaultfd: remove (VM_)BUG_ON()s
      userfaultfd: remove UFFD_CLOEXEC, UFFD_NONBLOCK, and UFFD_FLAGS_SET

 fs/userfaultfd.c              | 78 ++++++++++++++++++++++---------------------
 include/linux/userfaultfd_k.h |  6 +---
 mm/userfaultfd.c              | 68 ++++++++++++++++++-------------------
 3 files changed, 74 insertions(+), 78 deletions(-)
---
base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
change-id: 20250531-uffd-fixes-142331b15e63

Best regards,
-- 
Tal Zussman <tz2294@columbia.edu>

