Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640872627;
	Thu, 12 Jun 2025 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730504; cv=fail; b=DT9l3escGXM74YqqE+CRLw/YrrN0e4wcnRYORNhosRYiegW1bsyByu7+y1fJVbEr3yJggWuX+rlpIqtYfoyJW2A1UIS8+EvTSnXQtgasrcHylNbLghqyloXj7GreSP+urQ1702ObYPGQSJTG/3YjLX+7cqXuQ2FmQVOCoOPrrAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730504; c=relaxed/simple;
	bh=znKSWpsGwTJ8rDRzDUJtDCvY56ISvK3k8AsZJh9pah4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j6QPF4D5i0sLxMQ+tZskTVyzLKyXoNTG0FbF4bJqjQagUE8GGzp3VUT9hmv8ePRKeQHO7EIknNKMA9Zngs2sPsR+XBjYXfFmVBrE3/C+KIdLvrwaRaUjv7iQtcan1SYwW4VNRNdLQYRklUM5v6w09dV9D8Rvgigk4MIvoHRlKWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JHHoFUk3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=srCK5NSF; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JHHoFUk3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="srCK5NSF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C6kldP019124;
	Thu, 12 Jun 2025 07:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hEIerm8p0GkwE7rzzTaafUUGqdx1KDi/wZ2PiX2qL9M=; b=
	JHHoFUk3ClUupUfnGuAkfIfa4T5I2fL/4t0zJrx6ufbcKSWsPg9Eog78woYknvJi
	Eb7P+s2RG1h0tp53ihC8bcv7Ykr/azdRWLjhKHzbnyMw4H1smHBYz3pxDWjETa96
	6ccUQQIRX9i/8lfrEqeX2o7wPZhWqTO5/Yfpn8q3iIVnCTXrYBQKdMoGejE1h1Lf
	f+CzpY/bnIqLXgHZeYdE04Nyxi4HvQVsITsWvsAV+PPDf862C+gitbVy63Bp2/Vb
	X2EOuCywrl3d9PIumNIYddzZERavPDvFxpgvcnnrqs0vfcpgQQJjVgPQBt8f0b5i
	d4HDa6RSebNN4IwcPOFssQ==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2130.outbound.protection.outlook.com [40.107.100.130])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4760mww0sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 07:14:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJdLkdHQtfSgQi4Tvq6iUjUW794+8pWXp1d7czj5vduYgwLGpQ5xFF+RQ4aajsu42C76dGJap/lIDlTi/+bawe+visIQ+XJ1tl8TzmkB5uXSGgj3QwoMJyrsgvP9DT0eP6R6JtmyrjkTVVuOqgci7lqzuVYnHqYb5ZRlqkBlmJ1EcwQJ1Fa6QwO4aorWNGrWJQHix/xzulTibbeD2J2wu2OBnmjd3aRrwD5LJh/XoB+lvndJupLcv2sg36CQHxDec0ZyqC/XGbiCs9m2rmTxl6rp0I013b/LSHBwULwxrUQDNsoHu3RyoVV9JGvAILacW1zusNtD8hwfRJO9MyF2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEIerm8p0GkwE7rzzTaafUUGqdx1KDi/wZ2PiX2qL9M=;
 b=bIS1yZ1E0h8bMllZD6K1X2RCMbAqfxgNIh4j7/ejUwzU4SYfbqrIe5wIWjbtUj63p9n2HwQijLuOlNmq0O0LVS5co3PITj0x6BV4aJcVRXND4mGSkZrV9nDBX7YmXr/YsMx0B9vwqnseU/BsBzV8WC3EsUaPs8Cff2SOcfYkNmAJwql289E+fGkVuh9ACbRsOPGYAORAK/XsRIom+YcQ+QVVWI2XS9eFvl0v7cfvKYAebAbffMShAL0Ig/coceV20gFzl25fXvE1Lo2sT3zuFVmJy0uYu/gB3IzkN4vbiVV3Q5XRgnLCvBqu8JodMOc8pEjzJxWEUFGpG+lgtO99eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEIerm8p0GkwE7rzzTaafUUGqdx1KDi/wZ2PiX2qL9M=;
 b=srCK5NSF29bAqTnX+AGC1uXqoocF9Qgj8zYupJP82aYC4q/aJErIe5kjUrcGgzZ08LA/d4E9TagD766acNCDSuCKglRFKffnbCqfv5gtxOWPsrOWqXaRwB8ttYT0WyA+yOneK0Zec2nA24AbZz7lCXw6qvUbXxKir1h9fyAc0qE=
Received: from SN6PR01CA0020.prod.exchangelabs.com (2603:10b6:805:b6::33) by
 DS7PR19MB5853.namprd19.prod.outlook.com (2603:10b6:8:78::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.13; Thu, 12 Jun 2025 12:14:44 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:805:b6:cafe::93) by SN6PR01CA0020.outlook.office365.com
 (2603:10b6:805:b6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 12 Jun 2025 12:14:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 12:14:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8CC29406555;
	Thu, 12 Jun 2025 12:14:42 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 81AB882024A;
	Thu, 12 Jun 2025 12:14:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/3] ASoC: cs35l56: Use SoundWire address as firmware name suffix for new silicon
Date: Thu, 12 Jun 2025 13:14:26 +0100
Message-ID: <20250612121428.1667-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612121428.1667-1-rf@opensource.cirrus.com>
References: <20250612121428.1667-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|DS7PR19MB5853:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c1fe97e1-eb5a-4ce5-9bec-08dda9aab76c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027|34020700016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Um2U3keLskdShq/+lXer5fBTyw5pqvUK6GE7sRLiwzvdYGzZVWKbe6Cj8K4n?=
 =?us-ascii?Q?QCJ1Ic9ZaNgk4osSvXWH1iyDhCpYu7tqoSIX5MjXCbOjcTgEVv39BnDZEuij?=
 =?us-ascii?Q?nBJqe7cgveeanURlRVsBu5vUIcrqL2eUEdcrK4OwA1nWuXOXYba/o7nSAjSN?=
 =?us-ascii?Q?Eww33lZ4ADzQt1ib4SmYB9BZ7ICzxjSS49mbYkjnsKSd5UsspLAFCVhqAypt?=
 =?us-ascii?Q?CiKDVMYl5WU7pFKvmo2++ZnOzy8yhI+Gs6451QLXIx+2JYOyNwN/GqgLpIVB?=
 =?us-ascii?Q?gudsnW4aqhrdtHmwkuVv0e0Mr0pftb7hwwsnI8jUPR9jbqnebtyGbKi7sBLU?=
 =?us-ascii?Q?i89twelvzfG1dHiGfRtJThg+v1nm4aqqMdaFzuKQtMGjGc0vHW2EmnG50cXp?=
 =?us-ascii?Q?w7ZKICE6jZ2uCjc5YP6UAQ+KyjzSfHeDk/NC7TnpSm7AvKK/cLuw4Qu0yAjR?=
 =?us-ascii?Q?yWAMqGDZFioWPyeEZBXPXlXvNIe9ukeeyqYaIEzr9/CF+xWCdsj0CZDuN0T6?=
 =?us-ascii?Q?yKNJoli8gl0/O3mm1SDooMT2gmFSskrZJwpsRBYyhbHDEb51xj0KQbv5ZoRS?=
 =?us-ascii?Q?EV4GAVcN7xQp8FE5dMovhGkuZxnLFLhsxdNzuEXGwxfAGtCoOyLPVExALIfK?=
 =?us-ascii?Q?5URWoumR23H26GtCnc8jBtw/pJh41rU4VxJcucY1OCHdtOLRdOos1gNMoXuH?=
 =?us-ascii?Q?7hdCSGkTo3gTGuc30YmY/ect153J93fK7hNoy33DmXyHRj9L3xoyacDR/4zQ?=
 =?us-ascii?Q?XjE+wFk7G2JqXoYKeJ9xlNbDh6Gqo5wUMNuVYAJ/jkJRnp1XLSk55t/Wpmz6?=
 =?us-ascii?Q?e/KXffedHfnYlBKfex2cCJRuZR0k4o2t0lqgp7JJEA+TWXOmntDlL+G/3OMY?=
 =?us-ascii?Q?NUs8zwoiEJdSgynnTocosn8PxqpXfR8dhkFGkE8QiU+g+0bmJj7D2MNASRwK?=
 =?us-ascii?Q?PJYnq/D+QZcP/5/u6LkOIoNgKzqn6oAm2h7Ne02bKOPE+2KxXtHlAQJd9T3V?=
 =?us-ascii?Q?59Y5yHN0dp3cJL7JD/0WBVLkt4eIV9LT3uadWLW5RioHzV2awVgxgEjNDKLP?=
 =?us-ascii?Q?f3TwP+cr51Dal6l7swelveVbnojhrWcSXX3zLS/sE34KPu4cwdgB5TD/F+3I?=
 =?us-ascii?Q?azR9N9oJuTF/OGZigNhYwp8nm1+0EKDVG5iJKo/ToUH2ZiU0ubLSzI4NqyZV?=
 =?us-ascii?Q?wpUpRdzjn1qSWX6tVJsDPeBO5ZB0Xr0FIqOfQ8ZJYGyOpGhEDXu1Rg8wTANz?=
 =?us-ascii?Q?5nYW9rgWyQTPWBsj5T49a2ldAxkXEsrxeyuzpaeYGA0Okc7GtAIfskZ4FNQL?=
 =?us-ascii?Q?hqKgJj8uSCMyQ0D48DBGutr1YwKPZDHC2vxEUecDxIK55E5ZLhL3oYw+9kj/?=
 =?us-ascii?Q?Mc2vSAujPeLn4wO6pOlDXN/RneQJFUshKBl/tc9GcGu3AyMVc4koeZ0DaS4L?=
 =?us-ascii?Q?JCOo25LoOMrVThy1vnb24/ciJC5DEjCp9a4Ul1anWD3PI0SDYaNUkXdGeW8L?=
 =?us-ascii?Q?3+88Vy6hSkEgjSSu8iFeTQtvJ88AvyrGcAyo?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027)(34020700016);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:14:44.0609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fe97e1-eb5a-4ce5-9bec-08dda9aab76c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB5853
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5MyBTYWx0ZWRfXwN5lhB5fkONo VcLt4VNtba2Y8BdLtKTZHMwQUQvntSr9DJeo5HWrGx6StPSxQmLRNWFyCNVe9gbuYp1NSJfDizk 0OkL6jSKX/zN8y01jMQ3IF4VxdPVxoL+r/LJy+Dc47tL/uq2X+JkojLsWhvqPEbAbbD1wPk7AMc
 FFAPriCv015UkXI78bWrkwhXmcZK6UgRUPJ1tN3ZELJK9whPSICsXOQFYbzV9jAY/0bByX+gbnO 1aQRejjTdpNxffHd/5J4QTinIqDfiDLP49ZbYGhwQcAAPkLEXcC9CdyUrGBwxOG1r3qOuuMesmh d6tnRKSQBVI7H10W+VTBGUP8E9esvJdKBeEh0229pb/meusY3Tf/zjWuDB6a8MMndc+XVRlvNI4
 hmJH17OP70jNU+l1A/048xOgRGQ/DTXTisiKAkPw/2dN+y4pfLZuk+jLHlez1aZS307UTXd+
X-Authority-Analysis: v=2.4 cv=coCbk04i c=1 sm=1 tr=0 ts=684ac4b8 cx=c_pps a=YkgjLxFAvzeADdmzKhTo2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=Q2azG0amzhrUqwU4_OsA:9
X-Proofpoint-ORIG-GUID: qduRMvcncjyhqD74MM7-j7yla-2mhq8v
X-Proofpoint-GUID: qduRMvcncjyhqD74MM7-j7yla-2mhq8v
X-Proofpoint-Spam-Reason: safe

Use the SoundWire link number and device unique ID as the firmware file
qualifier suffix on CS35L57, CS35L63 and revisions of CS35L56 after B0. The
change in wm_adsp needed to support this has been included in this patch
because it is fairly trivial.

Originally, the firmware file names indicated which amplifier instance they
were for by appending the ALSA prefix string. This is the standard ASoC way
of distinguishing different instances of the same device. However, on
SoundWire systems the SoundWire physical unique address is available as a
unique identifier for each amp, and this address is hardwired by a pin on
the amp.

The firmware files are specific for each physical amp so they must be
applied to that amp. Using the ALSA prefix for the filename qualifier means
that to name a firmware file it must be determined what prefix string the
machine driver will assign to each device and then use that to name the
firmware file correctly. This is straightforward in traditional ASoC
systems where the machine driver is specific to a particular piece of
hardware. But on SoundWire the machine driver is generic and can handle a
very wide range of hardware. It is more difficult to determine exactly what
the prefix will be on any particular production device, and more prone to
mistakes. Also, when the machine driver switches to generating this
automatically from SDCA properties in ACPI, there is an additional layer of
complexity in determining the mapping. This uncertainty is unnecessary
because the firmware is built for a specific amp. with known address, so we
can use that directly instead of introducing the redundant intermediate
alias. This ensures the firmware is applied to the amp it was intended for.

There have not been any firmwares published for CS35L57 or CS35L63, so
these can safely be switched to using the SoundWire unique address as the
suffix string. Also note that the machine driver in older kernel version
only has match entries for the CS35L56 Soundwire identity so any future
product with a cs35L57 or CS35L63 would require a new kernel anyway.

There are already many published firmware for CS35L56 B0 silicon so this
keeps the original naming scheme on those, to preserve backward
compatibility.

Note that although sdw_slave.id contains a unique_id field, this cannot
be trusted because the SoundWire core code also puts magic values into it
that it uses as a flag. So the unique ID is read from the chip register.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-sdw.c | 18 ++++++++++--------
 sound/soc/codecs/cs35l56.c     | 29 +++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.h     |  2 ++
 sound/soc/codecs/wm_adsp.c     | 21 ++++++++++++---------
 sound/soc/codecs/wm_adsp.h     |  1 +
 5 files changed, 54 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 13f602f51bf3..fa9693af3722 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -238,16 +238,15 @@ static const struct regmap_bus cs35l56_regmap_bus_sdw = {
 	.val_format_endian_default = REGMAP_ENDIAN_BIG,
 };
 
-static int cs35l56_sdw_set_cal_index(struct cs35l56_private *cs35l56)
+static int cs35l56_sdw_get_unique_id(struct cs35l56_private *cs35l56)
 {
 	int ret;
 
-	/* SoundWire UniqueId is used to index the calibration array */
 	ret = sdw_read_no_pm(cs35l56->sdw_peripheral, SDW_SCP_DEVID_0);
 	if (ret < 0)
 		return ret;
 
-	cs35l56->base.cal_index = ret & 0xf;
+	cs35l56->sdw_unique_id = ret & 0xf;
 
 	return 0;
 }
@@ -259,11 +258,13 @@ static void cs35l56_sdw_init(struct sdw_slave *peripheral)
 
 	pm_runtime_get_noresume(cs35l56->base.dev);
 
-	if (cs35l56->base.cal_index < 0) {
-		ret = cs35l56_sdw_set_cal_index(cs35l56);
-		if (ret < 0)
-			goto out;
-	}
+	ret = cs35l56_sdw_get_unique_id(cs35l56);
+	if (ret)
+		goto out;
+
+	/* SoundWire UniqueId is used to index the calibration array */
+	if (cs35l56->base.cal_index < 0)
+		cs35l56->base.cal_index = cs35l56->sdw_unique_id;
 
 	ret = cs35l56_init(cs35l56);
 	if (ret < 0) {
@@ -587,6 +588,7 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 
 	cs35l56->base.dev = dev;
 	cs35l56->sdw_peripheral = peripheral;
+	cs35l56->sdw_link_num = peripheral->bus->link_id;
 	INIT_WORK(&cs35l56->sdw_irq_work, cs35l56_sdw_irq_work);
 
 	dev_set_drvdata(dev, cs35l56);
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index c78e4746e428..6e6120c39965 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -853,6 +853,31 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	pm_runtime_put_autosuspend(cs35l56->base.dev);
 }
 
+static int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
+{
+	if (cs35l56->dsp.fwf_suffix)
+		return 0;
+
+	if (!cs35l56->sdw_peripheral)
+		return 0;
+
+	/*
+	 * There are published firmware files for L56 B0 silicon using
+	 * the default wm_adsp name suffixing so don't change those.
+	 */
+	if ((cs35l56->base.type == 0x56) && (cs35l56->base.rev == 0xb0))
+		return 0;
+
+	cs35l56->dsp.fwf_suffix = devm_kasprintf(cs35l56->base.dev, GFP_KERNEL,
+						 "l%uu%u",
+						 cs35l56->sdw_link_num,
+						 cs35l56->sdw_unique_id);
+	if (!cs35l56->dsp.fwf_suffix)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int cs35l56_component_probe(struct snd_soc_component *component)
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
@@ -891,6 +916,10 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 	if (!cs35l56->dsp.part)
 		return -ENOMEM;
 
+	ret = cs35l56_set_fw_suffix(cs35l56);
+	if (ret)
+		return ret;
+
 	cs35l56->component = component;
 	wm_adsp2_component_probe(&cs35l56->dsp, component);
 
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 200f695efca3..a84c83eb2d7c 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -52,6 +52,8 @@ struct cs35l56_private {
 	bool tdm_mode;
 	bool sysclk_set;
 	u8 old_sdw_clock_scale;
+	u8 sdw_link_num;
+	u8 sdw_unique_id;
 };
 
 extern const struct dev_pm_ops cs35l56_pm_ops_i2c_spi;
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 3c580faab3b7..13db9c6650d5 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -783,16 +783,19 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 					  char **coeff_filename)
 {
 	const char *system_name = dsp->system_name;
-	const char *asoc_component_prefix = dsp->component->name_prefix;
+	const char *suffix = dsp->component->name_prefix;
 	int ret = 0;
 
-	if (system_name && asoc_component_prefix) {
+	if (dsp->fwf_suffix)
+		suffix = dsp->fwf_suffix;
+
+	if (system_name && suffix) {
 		if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
 						   cirrus_dir, system_name,
-						   asoc_component_prefix, "wmfw")) {
+						   suffix, "wmfw")) {
 			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
 						      cirrus_dir, system_name,
-						      asoc_component_prefix, "bin");
+						      suffix, "bin");
 			return 0;
 		}
 	}
@@ -801,10 +804,10 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 		if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
 						   cirrus_dir, system_name,
 						   NULL, "wmfw")) {
-			if (asoc_component_prefix)
+			if (suffix)
 				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
 							      cirrus_dir, system_name,
-							      asoc_component_prefix, "bin");
+							      suffix, "bin");
 
 			if (!*coeff_firmware)
 				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
@@ -816,10 +819,10 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 
 	/* Check system-specific bin without wmfw before falling back to generic */
 	if (dsp->wmfw_optional && system_name) {
-		if (asoc_component_prefix)
+		if (suffix)
 			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
 						      cirrus_dir, system_name,
-						      asoc_component_prefix, "bin");
+						      suffix, "bin");
 
 		if (!*coeff_firmware)
 			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
@@ -850,7 +853,7 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 	adsp_err(dsp, "Failed to request firmware <%s>%s-%s-%s<-%s<%s>>.wmfw\n",
 		 cirrus_dir, dsp->part,
 		 dsp->fwf_name ? dsp->fwf_name : dsp->cs_dsp.name,
-		 wm_adsp_fw[dsp->fw].file, system_name, asoc_component_prefix);
+		 wm_adsp_fw[dsp->fw].file, system_name, suffix);
 
 	return -ENOENT;
 }
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index edc5b02ae765..075ea0bd06eb 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -29,6 +29,7 @@ struct wm_adsp {
 	const char *part;
 	const char *fwf_name;
 	const char *system_name;
+	const char *fwf_suffix;
 	struct snd_soc_component *component;
 
 	unsigned int sys_config_size;
-- 
2.43.0

