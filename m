Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C038024468E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443747; cv=none; b=KXqTZBvANKixDPcHuNZVWaskogHHpjeedvlBpbL49/LMd6xOW53EhgGmBjcuFdWgK8VANJY1xFWVrHouf14ZH7tTAW3ObvsKq1r/QLWPz2o/NSnHvDKPtiYZ4eVPmMZEi62stbxR2o6V+rOQJwAJexgrI64oqROMj6sAunoC/jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443747; c=relaxed/simple;
	bh=VQOLPE77VFynA3OuP+UbKKlDLBd4nZcwYEnXe3Z4ge0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aBRTzIZEsTOmER+Sw6qi3PmdSWW/RqIUvzaHtLNRhB6Tebx4AhxDxR/bkFoAqxYovaUNCggqGT6hE/8PpZpXwSdvGycwde4kKgd/tlDxjdgCyaz4HtlnE0r/wDfgG8Raaqmjhh5ndHINUoXM3OYcCZrpswU00dqpjwWm1PS8tfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=R3bsEbHl; arc=none smtp.client-ip=209.85.160.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="R3bsEbHl"
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-47ae894e9b7so5869211cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745443744; x=1746048544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCLEBLaRRQintuh2DWGEvr+93VgxR5KQlNFuF1s8elg=;
        b=R3bsEbHl9k2XqkAG7VrttB9h0tJ+LLbqMhDgYj68NVu0/IEuF54hp1SoZYxQ/LUdR8
         itGUpTUfUBM01vhn7NqHG8qOiXuvIoNbLHusrvykp+OHvqVIQ4uxebZ/SsuudI/124C6
         mJKupJqejpnQVmKPcmLItLAYF/RH+w3rnWLGVcoFCbndPZn2MAB/PlrePnCp6iko/LUy
         UN3Jbr0vV7LVlHt+5h35V/VfzAXtfFEyWT3x7NjuR687uEZjLtaRRv2BoimDGUxACFz9
         cjLjq6aZPUf+B9DCg6qN8HZHMueuMC/0fDUHqNyc+nyeww1FxU0AjeEzcSnhTyI7Al6e
         MJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745443744; x=1746048544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCLEBLaRRQintuh2DWGEvr+93VgxR5KQlNFuF1s8elg=;
        b=WQuJIVytx5WETu0uKVAZgznN4qFtb5Za5hEgXx3FVaLWahjuf7tV1W1oCmIJT/MWEF
         dCFQfzz1E6WmUFU9ibHsEXZABrOZ72NW0VaJtRGWbDan1AgqRMflW9BQ6m98cZsy277W
         x5A6zKyoilVw7oW2BWpWpQQFZBTwVwIs7llOnInuewQ2dUI4L9h2IrQzGRqOV/7iJBZ3
         GprzCUvHrXwk4jALj9yWn7X/kDBrP6XFTXAwtPsh2vNkOmcvqe+jl3HMXl2EEhIhP8Df
         pvIlDl4GHXWjD+EyR3t0vPyxZo2nIEWDc0vvcEsyeAeLOX8OH/8CoLBNrxa2aLWkkihD
         BBLg==
X-Forwarded-Encrypted: i=1; AJvYcCWk3FFBDeoFQvJ/bs39pJBqjJhiXGvCYSvAhO+Ct/srgZ6lV2g/slw9v6ls0UYXGquvw3mjRhLCdj6BM3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGOzhbmqgn1gnG1gaM61UxFWK+kOm/wC5kdnJaU/DGl9KwIdqO
	Oh6aJ/UGDaHgj+/c+qN/J/ZpKwJgAxjCNPHqYB7dtEw5y4DAo2TB0/dNfQCDzy3XguCB3H2oHWQ
	Qpf8L4/09XcI7OApOjUcnfWvnbb1EjuJzgUzWcHLbAQpnBvcQ
X-Gm-Gg: ASbGncsN8c4P+C5xfQTsSQz0bFCTxuJ20awjdTNfJHPxxmiziPhDqcaJFzDnqXaE+0t
	RlFYLwiLEaQt/EpAHl8TbXSMUJh3OIGvFm3vhQMIRjufkYsErTmUEzTtIo3rzOtGtPw7/siXrUn
	4TePyvEuq6nng/YTsYY0R4RuMb/GQeSYsFKbEePD88qNp88ofp/n5qgk2O5B76ltQYB6FUnL3rJ
	pJjv6pvieXMDe0gva9QuJkPPuiZ4SL5GNoQilkbEIalPg+6n9O/JkFyy0rO8fwjvy8sJfWXZgkk
	Gubs45WnoPpnydTN7cfk4PnuN/HzZrs=
X-Google-Smtp-Source: AGHT+IHnxwparxBZcK/VdcwSG32LkVIXSTRmpTrN+S3RXdjd04hZ9i9TCbHB9cDNMgycgsgCMiBSIn3HDpqA
X-Received: by 2002:a05:6214:500d:b0:6ea:d629:f492 with SMTP id 6a1803df08f44-6f4bfc7a7d9mr3649076d6.29.1745443744638;
        Wed, 23 Apr 2025 14:29:04 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6f2c2b1e111sm5267576d6.37.2025.04.23.14.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:29:04 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id F2CA43409F5;
	Wed, 23 Apr 2025 15:29:03 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id EBDFBE40E4A; Wed, 23 Apr 2025 15:29:03 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Wed, 23 Apr 2025 15:29:03 -0600
Subject: [PATCH 2/2] selftests: ublk: common: fix _get_disk_dev_t for
 pre-9.0 coreutils
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-ublk_selftests-v1-2-7d060e260e76@purestorage.com>
References: <20250423-ublk_selftests-v1-0-7d060e260e76@purestorage.com>
In-Reply-To: <20250423-ublk_selftests-v1-0-7d060e260e76@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Some distributions, such as centos stream 9, still have a version of
coreutils which does not yet support the %Hr and %Lr formats for stat(1)
[1, 2]. Running ublk selftests on these distributions results in the
following error in tests that use the _get_disk_dev_t helper:

line 23: ?r: syntax error: operand expected (error token is "?r")

To better accommodate older distributions, rewrite _get_disk_dev_t to
use the much older %t and %T formats for stat instead.

[1] https://github.com/coreutils/coreutils/blob/v9.0/NEWS#L114
[2] https://pkgs.org/download/coreutils

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 tools/testing/selftests/ublk/test_common.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ublk/test_common.sh b/tools/testing/selftests/ublk/test_common.sh
index 9fc111f64576f91adb731d436c2d535f7dfe5c2e..a81210ca3e99d264f84260aab35827e0c00add01 100755
--- a/tools/testing/selftests/ublk/test_common.sh
+++ b/tools/testing/selftests/ublk/test_common.sh
@@ -17,8 +17,8 @@ _get_disk_dev_t() {
 	local minor
 
 	dev=/dev/ublkb"${dev_id}"
-	major=$(stat -c '%Hr' "$dev")
-	minor=$(stat -c '%Lr' "$dev")
+	major="0x"$(stat -c '%t' "$dev")
+	minor="0x"$(stat -c '%T' "$dev")
 
 	echo $(( (major & 0xfff) << 20 | (minor & 0xfffff) ))
 }

-- 
2.34.1

