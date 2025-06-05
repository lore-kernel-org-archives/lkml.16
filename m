Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B151204098
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749119825; cv=none; b=nGwmLsbcTO+wUhHEe1BkQjNQt4q6Pj2NYFLVw4oF6V15Y+n4LMrb7dXGT5xAeK7Ig8yujO42wHQ2TMoflF/hRKrxQL5doBFdcC7GHQUuh6Q9tV3YFVWiyd2Qs7Dr19nmrct6DI+Sr5qZqMTgYqBUERuP/EXqXiuSuQzXpxMPbUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749119825; c=relaxed/simple;
	bh=HvbmQ8S8Xhki+213LburIQLRhHEu40jaB3IQomFM2a4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F47eHTgAxH+lQ5Ls5gu04cW5OgXiEgvPhYIx5wwhqj5q/i9+j40ldugdz3jCpwv5Uft2VZ2VwU0zIbFf2fcc/MUIhzX8GhyZxubWscImUfNIJh8nOYIWeyTDxi9lSN7AoOF0M6B44nv8+kRb7LotfYE6KcjiWXOAmeKZn5/4fNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B6clUDOm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B6clUDOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749119822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HfZ+Rq3UxyS14Y2YLAxAGNmm5WZCXoHrHzmHr+0WtKs=;
	b=B6clUDOmx1qOmcgWvYkFbqxZkBK04XOPsA+9UG0nlStwOVP2z+ikUoncbG7d2FN0h56UZZ
	TzB6peCusGWwzB9rqXFCPRLQktbL/JddoayjbZXgXDvrx5GQm31SCY8BXXijXzVo4hWJWu
	H0lICCuCbSHN6Oj2dOdtwifuq83Sz7M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-8QsZqkaNOFuZg2Vcvbhxxw-1; Thu, 05 Jun 2025 06:36:59 -0400
X-MC-Unique: 8QsZqkaNOFuZg2Vcvbhxxw-1
X-Mimecast-MFC-AGG-ID: 8QsZqkaNOFuZg2Vcvbhxxw_1749119818
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so5051185e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119818; x=1749724618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfZ+Rq3UxyS14Y2YLAxAGNmm5WZCXoHrHzmHr+0WtKs=;
        b=FrnZD9pI93OQd3LvorAUZDhkaog56nRNmokOqmdVcA2Av/a33MqJ2qLLiQTNicq4ak
         Os9W0oh2E372iA2CYK/wXCP2wHwDL+Qkee65bvAclVRxBEaM2DDkUkPL2d/A8EVacBMP
         hKEfHV5BDI7fdeAeAeuokXqBePnJbG0Xz7grbVfPuROZPWtshiV0Dol1svgnuUE3uNB2
         B7w6GfueNxL0TuaQ/P19hGvIt24Ewn5p2Pc8i8wFHjsq+bHW3HDoedsUzvajeEkJAy3E
         zyx9689rgGtAAElff948K3Z28qpd6+m9FFSrTrXUxThtWItWSMUC1IVY/IhuoTt2g5H6
         YajQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEqpvnZs72DTJH4wcy5hvxWAZqhrvbvsbjpcnkWwGK+5Mw+/J7ZaB0+ZOUFgMb6x9lgw85PRfFdXipW+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG3Z7p257DMScdDop/WlHy1aMjacwGhL5rDtjOI3c7uBnBU4Fc
	oKvbsHUURE60TEnpHM26ZylSH1pUIcXkZ550Iv0Q51r4Rb1Bv9nK8wi79B7+978tIBoQW9kjyvu
	Qh0dEHo86H1G+O1gNciM7ftwX7enEjijOlLZcyA9d5u9k7vxAbjkJKO7D7TZisjEi+Q==
X-Gm-Gg: ASbGnct0W3m7DWT/dw751yzbvcsNSszKXG+WRbMRuXwc+44FrVjRDBMSPutAxzHfY73
	rxmn2GT3cZ0FKYIwHbmC/if/vMhjohlomiEy3SSMp9qA/BBhwkwPKFOJn27cLDcHYqkJBzHniDf
	qJt3ooFL4OOhP9RS+O3ZhvbAeh/wrPMQJxlC0huxYSyBuXRL1md4zzu7kkdiEY9hR7bFQq1079x
	9mg+66yY7wg45OEZkKHnq/Xvdsx/YmaXjaVuCp2M8xUeRYfZJeiWXwsoq/Aoemo+nGeJOnH+6Dy
	jLu76dgRltt1AQ90IdIT/+qrLRDMBvuHi0IaiRQBNp0dVSDlv4T/Ic1oBTVe1NimG7HehpIKig=
	=
X-Received: by 2002:a05:600c:64c3:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-451f0b42832mr62125205e9.30.1749119818008;
        Thu, 05 Jun 2025 03:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1bx8suhPbgO55wHNgDBL3CiHw3bkoX/59SOoKYKbZiUG9FMRz0rmV3itW+HwRwGTHenI8UQ==
X-Received: by 2002:a05:600c:64c3:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-451f0b42832mr62125005e9.30.1749119817668;
        Thu, 05 Jun 2025 03:36:57 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8311ae6sm14105175e9.2.2025.06.05.03.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:36:57 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v3 0/4] KVM: arm64: selftests: arch_timer_edge_cases fixes
Date: Thu,  5 Jun 2025 12:36:09 +0200
Message-ID: <20250605103613.14544-1-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some small fixes for arch_timer_edge_cases that I stumbled upon
while debugging failures for this selftest on ampere-one.

Changes since v1:
 * determine effective counter width based on suggestions from Marc
Changes since v2:
 * new patch to fix xval initialization

I've done tests with this on various machines - no issues during
several hundreds of test runs.

v1: https://lore.kernel.org/kvmarm/20250509143312.34224-1-sebott@redhat.com/
v2: https://lore.kernel.org/kvmarm/20250527142434.25209-1-sebott@redhat.com/

Sebastian Ott (4):
  KVM: arm64: selftests: fix help text for arch_timer_edge_cases
  KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
  KVM: arm64: selftests: arch_timer_edge_cases - fix xval init
  KVM: arm64: selftests: arch_timer_edge_cases - determine effective counter width

 .../kvm/arm64/arch_timer_edge_cases.c         | 39 ++++++++++++-------
 1 file changed, 25 insertions(+), 14 deletions(-)


base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
2.49.0

