Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8F258CE3;
	Wed, 30 Apr 2025 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009129; cv=fail; b=PaV0WQx2uDlYbJoORJg2cmbwcG/4Bk3+36GCjDWxY4HG8uUZLK45KW5qSvwjB0qEkipIJrAQlvqRiX8n+5SxCNrVa89pPc+iIhzbPMPwutIFPFDCyjw4oDcL/8EMiNbBdUloODQZvKq7O3f3Gt2Avt7Yv9qHICNm4l9+sAshkA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009129; c=relaxed/simple;
	bh=Q/wnkBVQak4vWTxSplp4zSN3HEXU2mgtrqk2FMQEojU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sLx7ZQjom+D25l951OtIM5jwByv2iyzEvep5Rshr83Nvo2SU6Zn4AxrkYBJbhdk0SGlpLKUqMnOf20CbpmGPYJwPKYosK3mpeQQf7ixT5REdSL/T8HdShmiEVHaHX0hJ67mglHbb42ARNvLCRX4834BufyxawHIj3+9guYcrDKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GjYFw0ZI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZrGgsTYY; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GjYFw0ZI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZrGgsTYY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U4hN4p005752;
	Wed, 30 Apr 2025 05:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=FaaSFqmB1wGXaqMu
	M/phfCMCPKMkAxVKiI9D6AouIGw=; b=GjYFw0ZICGbTx1E9oGCH/j9koCcUSdkV
	dThMd/OShqiO+KZtcsO4JU+/F9hEcmOpQ5rv4FNir5Kx1USiT8dACWXEDHx+3a2o
	mTGWRGhuKMaGwFKyN+55mH4bw+3z22q1ZA+cC6RUervQutNeCnmP9jh5EN9LCB57
	kQOTQJh7+Q4ksYjcjTsMJI8AZ1iR7YzEQ/HZcPSxqXvX19Ev8lNYy1WqzAnKWmAk
	5K+t1W9h1NThtcElx5Zt2OYzz33Jahpea3vJRiAdnwrf36MtHxq+FWSCs6eQ6w6P
	nPRJxEiJ+w1t17mvWNL+mo7E8esFKTH3fTKpyc6aRw7mtjP40HU80Q==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46b6te8s9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 05:31:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQcjMjcq6q6f8iyElO4t+9nZrgkcqqrHbqrZxD/FMy0a/+zfwvojr6S9VGg6P78FjUiQmKWADu9kadKt64Jc8c80QpGJDm4jW6Z/eENcJEzc54w0ES4M+hSX0HyYrsBBROp1bKosmLEL22H29RgzQEOTYnwMynmnuPOVwdT1c+qhTjjKADQp7EhGngWilxfdYiQ9B9L3Le/79qqEadrhLWh/1GBvOFveE5lI26T61DVBgB8fJYpyxkNfIjom2PlkFt19EQY34NZjZuUMfmS8EZYpoCh2aQbk/o/6iNTmJRtFSZucR6kxkt/qphUrOuuVOl4SQFC1TogT9wKK7Iwgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaaSFqmB1wGXaqMuM/phfCMCPKMkAxVKiI9D6AouIGw=;
 b=QwyCMOz4NUOkcHZbbYQYYIcxQEPdDVrtECsAZGj4po/nzEG4l7lGbiTLprO9GMrS94f4O9w7CsVpJYPOPkdOMxBoWkMsmTQihAcTc0tZwffLFFRx/q6fE4ffO411jTExeEeQhNyRnkC7zsfvCYlv7RA/HP2lIruay3L18x8oLmY/Papp17g0fiq81w9BiG84grVRAtaDsL/k9k5jUMbhdEaPb0o0++v1DvFkBTPokI/p4xmy/ZG4lGfE4MIDIiej++JQtBNKMdDe60UZlw4CUoaKmjV2khB1RVp9IjNtlfcF8huO8H/aXzKE50EqYegXAJBKuirlh+h4oc/Fm8lywg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaaSFqmB1wGXaqMuM/phfCMCPKMkAxVKiI9D6AouIGw=;
 b=ZrGgsTYYUvQZjtSgIb/n8prGLKMkb4wDje4Mlqx5rSL6Y9aS61/sWrDKdUWGv3I5iBYSFCwCRezohh2KEGS8xILJ4f4EW6siCH/UGBr3SEGTS1k/zrLwXWgzstlhoPpQXDzDFuySgdcDBDuxyOmHoT6gWEV+jpHeGp23lb1wMN0=
Received: from BL1P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::24)
 by BY3PR19MB5043.namprd19.prod.outlook.com (2603:10b6:a03:360::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 10:31:43 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:208:2c4:cafe::9c) by BL1P223CA0019.outlook.office365.com
 (2603:10b6:208:2c4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 10:31:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.2
 via Frontend Transport; Wed, 30 Apr 2025 10:31:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 91E97406545;
	Wed, 30 Apr 2025 10:31:40 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 438E7820244;
	Wed, 30 Apr 2025 10:31:40 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] ASoC: intel/sdw_utils: Add volume limits to CS35L56 and CS42L43 speakers
Date: Wed, 30 Apr 2025 11:31:18 +0100
Message-ID: <20250430103134.24579-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|BY3PR19MB5043:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f18d7739-89ad-4aca-6355-08dd87d232c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mkhy6W3Hxz7W8wKnVPNLJ5gPJSn+i7bVyY9vbN9Az4voxX5kT9DDAEIzfk8O?=
 =?us-ascii?Q?ets37Qz4nUjCSrg72WsPCpPBdZHGtA19S9sa2jibClVzpa0fkDRbHd6uLIZR?=
 =?us-ascii?Q?o8xdVp2JHFQkkrIsZu+aMdlZPCDyw5fbaGdkNbB5FdN82Z7IpBDsUlSFSsH0?=
 =?us-ascii?Q?enPJNl+7HfVTp8FNpboVP8oMrl1yxC16uqcaO5xZxyRuBCwPeuHwbXLfpZtK?=
 =?us-ascii?Q?99OB+D2pCXNL7ccof2Gyloc2AmIAsJdUkUypPWv6wBpnGCwNyCIgAvLN8gkM?=
 =?us-ascii?Q?dkDBmm3Y73dtp9P3V54cxjm+CfCqjmLld0ionq/iahkxSn4dNISwpLugjTKX?=
 =?us-ascii?Q?LD16EhPpt84ERQGQfJCji3MLK8BA7uUuf+RPNPcJjkzH8CHzytI5K1/hnoMb?=
 =?us-ascii?Q?4HQc/qTxtMvjz1RwLb7S5vud08sDZvrQwFalgP2yCitNe+ZR8v2h+b6lED48?=
 =?us-ascii?Q?d7DPA/PoWL0fEzNdEcabtxUwaoMYke9dtbosEQEmlvbA6iCzvvpbFl+cJKyH?=
 =?us-ascii?Q?UdqBNS4kJ2vnzmyfed/MJ+q43JFJZwdksnJRVmKcSszQUXKuK1jnuGrPKawu?=
 =?us-ascii?Q?uC90zubhSyeB/EK9yqCGX7doBXZIvW3Ap0AMRo2M3zwNt8+SFJ89nrH0kmAm?=
 =?us-ascii?Q?DFVE6n7wHGSYoDcPT7j0wmiiM0e0iY8fGPC6vFtH9XoPn9ils4GLv+hMstzu?=
 =?us-ascii?Q?q6Dn3uU00m2W+aUFVVlN+nlr5mIjZdm8e/gFxwr3nmV/Kd0dqCCdMikfuZN/?=
 =?us-ascii?Q?wDLuccrSO7rkqDcvGx10Pk1SHVKNrkVcGBTb4A1A7ZFK2kXF9TcO7Sj8Ttjr?=
 =?us-ascii?Q?l/iLpSnA0Nww+r7fwm2pdC5GL5OwAwoE50uDMtBHSnlVwL7QKEFTTCi0cEbj?=
 =?us-ascii?Q?LxhjSS8BIpxOnOvchMyC2bVFiGqcD9rY+6fgS20lVc38QC3tZcYQJ4ohvpxC?=
 =?us-ascii?Q?+cUHSgNzN/vA+vHxjqtmenEFwK3mjq5HhTn/Pk3yD2i2oA/rJRjPUNDBOVqu?=
 =?us-ascii?Q?42jXBiUI/pfNxdpfqqb7un/WLRTecJ/snhcIYXQ7Netcc474x2KJBbMm6IJr?=
 =?us-ascii?Q?idVwDAetvJKEaXn0B9/ixVF/3WP6pLhs7+2nWyqkSiGC4/GrHLPMnT7N3KPQ?=
 =?us-ascii?Q?OnE1TmRzrc2PorTgTr/As9XZrDDZTRpUNdl8hYHE+pwTitk4WmCTatQgczEe?=
 =?us-ascii?Q?lEImORBcYUqaZL13to2eENE93Onow3yaRFCI9tlCrbMPxJodDWiGO3k8AQmO?=
 =?us-ascii?Q?xeDorGECnS3fNHAbRrUplJDVlUNXX1RhpD+G2jA7aTGujZ8qEv4VNmywqSRf?=
 =?us-ascii?Q?636MhjtbcypeGP6fu9aSEDCnDhuQieO0KF9aGfUqh9gwAtGUGxBAFR0MBVOh?=
 =?us-ascii?Q?HDvNDoc4ZVfeRPbJ15a1hbQuRXRNIgGQCB/0AmIbxM3D7wDR/jxZeQ1ZK8N6?=
 =?us-ascii?Q?MYSPOxvn2v6B7VXmRDv5Sl16wt0MAQGd1vMI6IBoZiqnqpEe6ErGwA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 10:31:41.8758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f18d7739-89ad-4aca-6355-08dd87d232c1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5043
X-Proofpoint-ORIG-GUID: T5zeyV5aJVOSVImh2I0zXmesUPWuJgJk
X-Proofpoint-GUID: T5zeyV5aJVOSVImh2I0zXmesUPWuJgJk
X-Authority-Analysis: v=2.4 cv=I9ZlRMgg c=1 sm=1 tr=0 ts=6811fc15 cx=c_pps a=0XndbtkAAnsFgPxdSZG6GA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=RWc_ulEos4gA:10
 a=_pwRrJzO5ymmx7wZio0A:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NCBTYWx0ZWRfX39PjGRP3LvrY 5FSj/dQ6D1p1jrSlGQyd06xz4QQO09ma2JWD3ImSuX9lhkfulswG3VsIDBX5mYHSFHKYnGg6pmM rCs+ZTd7N4PnXpzHQYB+BOWYkgD7K2vrWdye5z7rbAohJUcT3eFx0leKURE6zNpJvFSlumcb9VS
 sB8zhs2PvfpL9QoNiYoT6xVj8tid3OjU2DIsJybkxjvjYJbMgYYXfMN8wqMCtX1ToRxylyGx4E/ EBoSIh/6RDEUGwmZWxNl5JKLHdZ5RUmh+Mi+T89Aaq8aKyNFnxuF50CNnKrAmq3evMCbZh1HWGJ Gvvx65GMSzzQfABKhaVHdG3gfjprTQrO01u2vAZGNU39hx3qDg/aGWawujqNNQN5EwYvJKbHcNS
 I4m0LThVj8QkZH09NYy1iWucgm+cF9w/qJxzuctCyum/dqw89B6XhrEVrqeovMXDbnz3XPNR
X-Proofpoint-Spam-Reason: safe

Both CS35L56 and CS42L43 have maximum volumes above 0dB.
However, for many use cases, this can cause distorted audio, depending
various factors, such as other signal-processing elements in the chain,
for example if the audio passes through a gain control before reaching
the amp or the signal path has been tuned for a particular maximum
gain in the amp.

In the cases where systems use the soc_sdw_* drivers, audio above the
0dB volume will likely always be distorted, therefore apply a 0dB
limit to those devices.

Stefan Binding (2):
  ASoC: intel/sdw_utils: Add volume limit to cs42l43 speakers
  ASoC: intel/sdw_utils: Add volume limit to cs35l56 speakers

 include/sound/soc_sdw_utils.h                |  1 +
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c |  4 ++++
 sound/soc/sdw_utils/soc_sdw_cs42l43.c        | 10 ++++++++
 sound/soc/sdw_utils/soc_sdw_cs_amp.c         | 24 ++++++++++++++++++++
 4 files changed, 39 insertions(+)

-- 
2.43.0

