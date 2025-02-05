Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FC622ACFD;
	Wed,  5 Feb 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755506; cv=none; b=quE8fCaMCNatqce3UP/XsMOvZmcLyHVEZ4K6T7+o/uWJQsooA0NlPf/ecmp4w/K7Qe7mjYmbrm7qVngiZ6unTU0W9aeRVsJeQKQeHC/7x+EXvgkrY/KV5qmzVMUDTup7BYBD30iqx/+JRAcYvGY8XyO6L8r8x7CxeuZNdoYEAgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755506; c=relaxed/simple;
	bh=FyMaT0c8SG3dm6NlFAGWw9ZlD6XTZ6/H3HaZzSZzNhw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PjHPNn0ktIjKXfkhyUGOB02rOSQNXrXqPEqqWVnJhJRjTGyWD6NZpf25WZutKLHSIxWzeRku+8pgMh9WY/vY5cjNSlEpTlRfiKwXgVDzuqPeADpZtpR1mzrNzHsEvC4Gn3+++rVVmasrRIoZ9k52r4Ta5gf/lFzz088aaMwcyGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l/RH92qo; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l/RH92qo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5154qIXX016309;
	Wed, 5 Feb 2025 05:38:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=pXBRiVo8Fd9yCPnD
	CHqKyjsqLQRjECgo61c/izKFf3s=; b=l/RH92qo+xT7yuW7Pk7AYomPCUHiShei
	U+d/5hJMGhPjCum0JuLaIzrF+D8JM+sEkMhDLePQSqsqxipcxw+lvkpEkik+F16h
	+OQTJs37l/amaLFWxoCafpBxmGr5tMzqNFfTd18PfYfejweBbAFifpAMP9INiseZ
	zt8vgMkrs8CGYc7zPRQfS+1cqBXHXpLldcuDP7RXvuy4RviztHr7K4anNo2dKDIQ
	Bseb49kCaxnlu5i5roruvPKQVhaTZcgmQh4DCxzXF6Zq/KGqzlOheUVXMDK6NNAH
	J3oxfVDYPMJmRiqIDjumhSR+v6X05y5xsSQwfuH0Je1R0tDNGX9CTw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm4en2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 05:38:02 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 11:38:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 11:38:01 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1FD93820248;
	Wed,  5 Feb 2025 11:38:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <peter.ujfalusi@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 00/10] Add SDCA DisCo parsing support
Date: Wed, 5 Feb 2025 11:37:51 +0000
Message-ID: <20250205113801.3699902-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a34d9a cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=2OF5pOvXU3WomUeORNoA:9
X-Proofpoint-ORIG-GUID: kPhN-MKYpb054C5TzBBz4wAWdNHsx8J-
X-Proofpoint-GUID: kPhN-MKYpb054C5TzBBz4wAWdNHsx8J-
X-Proofpoint-Spam-Reason: safe

The MIPI SoundWire Device Class for Audio (SDCA) specification defines
most details of the hardware in ACPI using the MIPI Discovery and
Configuration (DisCo) specification. This patch chain adds support for
parsing most of this information into the kernel such that future work
can make use of it to construct CODEC devices and soundcards.

The most notable outstanding work here, is parsing the separate
properties for the Control Numbers (roughly equivalent to channels)
within an individual Control. The separate Control Numbers are
supported but currently only the scheme were a single default etc. is
supplied for all.  This should not be super hard to add in the future
but isn't currently required by any of the hardware I am working to
support.

Thanks,
Charles

Charles Keepax (8):
  ASoC: SDCA: Minor formatting and naming tweaks
  ASoC: SDCA: Add support for Entity 0
  ASoC: SDCA: Add SDCA Control parsing
  ASoC: SDCA: Add parsing for Control range structures
  ASoC: SDCA: Add Channel Cluster parsing
  ASoC: SDCA: Add support for IT/OT Entity properties
  ASoC: SDCA: Add support for clock Entity properties
  ASoC: SDCA: Add support for PDE Entity properties

Pierre-Louis Bossart (2):
  ASoC: SDCA: Add code to parse Function information
  ASoC: SDCA: Parse initialization write table

 include/sound/sdca.h            |   22 +-
 include/sound/sdca_function.h   | 1089 +++++++++++++++++++++++-
 sound/soc/sdca/sdca_device.c    |    3 +-
 sound/soc/sdca/sdca_functions.c | 1407 ++++++++++++++++++++++++++++++-
 4 files changed, 2480 insertions(+), 41 deletions(-)

-- 
2.39.5

