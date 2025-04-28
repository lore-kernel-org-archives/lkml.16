Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD0EB672;
	Mon, 28 Apr 2025 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745831305; cv=fail; b=SvXQD/7122sLsefMRVPc4apvrS8G9i+q5UG0RwyhXq7PVs7w7HBCpVcK54y1jO+oCN75rL7l3DS5L0VpDAS6Fbsdptd6jlx6bTDEn5BoLmtQSZHoGLT5mBX62RPyKuUdImoG8OTc33WuRmvqsq7t+qptRQWrEXlHbMeSxzvyBSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745831305; c=relaxed/simple;
	bh=41P1FoRszGfVTxHK/AgaqhaIXxWD9WnpQDVrr4VlL38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jDrEsKi51fbtEtqCNYg5p8x6zJ8desVMU113Kg8Tp7IFrklU+U22d37W/PW5JK0v36jPbG6ItaQMvNtrixZaYAB2rAVWJUEIKfrIqY3sIGvwWwSw6vaNaYtgkizim9BRWBunTw9Blw1AoRkNcEkBxC1Ryh0B7Ffcc1JbgP8wF9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=axuI5crD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IP+eCv/z; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="axuI5crD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IP+eCv/z"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S81H1X024764;
	Mon, 28 Apr 2025 04:08:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=BSoYf14dhbsIQ2Zk
	Pl8opFUnNAITdu5jhJpC5QFnRKg=; b=axuI5crDyKZW/xJSCeRESrhZ49CoPyxL
	gk7IiyWE+qWiRo/CKJ/eD5LHsiGEB1rPqQRPnF/50dLAYRp9S9FFVQ3cCxmq5mnR
	sr67W/QRKi9EqdK83D7NNsEKCz2ufAqFIdsmKJFSN+ff6TNR38mTlBOpY573rziS
	3/j/pBcL48SzPhp9/ByGySGQ8ARkHW3TiAa+JD1A7QEU3fdchXizwwSvfe0CiGmu
	PckmHaZ2eeMhRugN+6A0BHZYxINXL3kszAvnKj0z2xZ79+mIun8eD4iJRMJnYXc8
	bwTdIthZihIIVgGLVP3ovrtfdIVGp+ANKyvNrZBhQrNFTFhUlJ2UrQ==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 469yjg8bh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 04:08:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEXHjJVAI548G6SuDjlBw/kqEQ4OZVFOD5wbMnwSbpOSsrNxaMUoCWX9iXT8n6bJzZNpvElAb/FQOYadTnTPR+LmSVrsybrshOPu9qQVXvhLhlrbLbRed+CNPZT6rlm9ChbhoS1/ZDF/cub8mOatiFmd7N+lLoGE1bQvCF+NiRswPkZS296foxLbffgw0JFwYwKYE0H6vR3WAf4NhkllSFfTVV9v7/HWeUdzjB+Hwsy1/P9ZzmUDiA3/UcEDmS6veSdqlQ8lppycdeBLNlKMqW0FdmAgPPU78mzFUSd0Idl+mQvmf53Mb+XMzfgG9kfdqg4DH3vfTrUa23wztvZenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSoYf14dhbsIQ2ZkPl8opFUnNAITdu5jhJpC5QFnRKg=;
 b=bDJJu/P4cGnGUAMUFbSVQlrgLKmvsWB8Yadf/NrX04Mgk02Dw+JuESXqrPXS7t3be+JwmlQoXUv9LkfD2l6MOnjg8Ctxv1ZAsmyHdki3VOAAJeXM4yojeo39/jAqrjie5mfvfiEbFuniuAjToGn/Psqbkici9wJEnNp6/8DvjUCV1LLSPj/etB0CUw6tvHJ0OXxtuayFx3GisR0FZM09DMzsugy+KybsAICBiEpScQOb2Ur0IXGk2ikFBlNR9Ds6HL97MEzTlNZaWy2XeUzk4wPwA0gndPgYBYXxRoe/d3wvuvoNfpfRKssRN8dLdd5ECZQawNF5cPSfUE9Ze6opUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSoYf14dhbsIQ2ZkPl8opFUnNAITdu5jhJpC5QFnRKg=;
 b=IP+eCv/z+hNyXlqKxREMejtzl+fpClFG6ywK/SU190IzVCb6NROtylLDRlKtCuJk8BKJHdPh1dnYaIpNLtpo8HSWj+G6XXQZ+01d4mOOlT9SgbU/CB1ciM7Ya9EzsmiXNwdmkIizPhquU2sPhZj2kpThODxEZ/Ys3YthDzN4M6g=
Received: from BL1PR13CA0195.namprd13.prod.outlook.com (2603:10b6:208:2be::20)
 by CO6PR19MB5468.namprd19.prod.outlook.com (2603:10b6:303:14f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 09:08:08 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:208:2be:cafe::b8) by BL1PR13CA0195.outlook.office365.com
 (2603:10b6:208:2be::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 09:08:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.2
 via Frontend Transport; Mon, 28 Apr 2025 09:08:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C71A9406543;
	Mon, 28 Apr 2025 09:08:05 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 40188820244;
	Mon, 28 Apr 2025 09:08:05 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: wm_adsp: Don't use no_free_ptr() when passing to PTR_ERR()
Date: Mon, 28 Apr 2025 10:08:03 +0100
Message-ID: <20250428090803.97909-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|CO6PR19MB5468:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: faca6ed1-464a-444c-9192-08dd863430fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mhW7AYZM38CLGcNWBTYVABg1zqnYo2iC2QUu23pYxPoLqaYu34SHRcag4eTC?=
 =?us-ascii?Q?9xhMOk2pbBhcLXb5KUPfAuRIPTcmLwHl39cCCUGvt+YEgD0yao23YBehVzrP?=
 =?us-ascii?Q?196WWGx2EI2WPoLPExxLU6O5SvvYgjnVU/A7yUWcplylQLtembBtcAd3wsPd?=
 =?us-ascii?Q?kUr/KaFDZE8piPKNTgscC+a4tX2Ogt6rUJQqlx2nOkwkqT7wz38A32BYbx+y?=
 =?us-ascii?Q?WRM5LZF7h7gKp3cWe+Gp4DO1mso+SfWd2SGmPaMVwA2cK3DNF9b8awQz3Mnl?=
 =?us-ascii?Q?16VZWIlPAkqHOIZFGsYnbmNj4Ypxew/b0N7Nor3MkDRkUH3S9vY+Et9/GOC/?=
 =?us-ascii?Q?X7PQKcRl3UszVOyjkGHsVKtH4wczRcWmF7AjKXBqm2D8uUx2EZhwA28ucFbq?=
 =?us-ascii?Q?Npk3Xs3HyQlkRIdSzjDvYYaYCAupPb9S1w5ElsOL+IXoPLw1kQy9niGPb2ZK?=
 =?us-ascii?Q?Jr56hb4uq/QHuGgKMu+KIqwjW6PbOehAoTy1QaFRgJEOpVr27lhsChGzCmdk?=
 =?us-ascii?Q?MHwxU1ALTCnuiusB73fLunh3gPviY6dWmwV9yyh2BomVn+KjCwuqg4zbyvYx?=
 =?us-ascii?Q?pCPhMxL1GozpEAqwfkQa057T9tG8KcNDRDX8SMigdZOA4zSDXcvSBM3FVjNx?=
 =?us-ascii?Q?NJxs9WHWdt9x92XOcUxaQDDQ3+SuK/zJ4xU3lzS7aBRDQHUibX+aRAzwwmgn?=
 =?us-ascii?Q?/1QXfAgiMy4o/u4Sjoj0skJ0FYWNAKpmmMcCKgJNcgWN6BJMCFJDMKywNOxC?=
 =?us-ascii?Q?ykBXcCsSP+a7dcNHUMpxLQYeui7aHNYfPW4qC639mqBk2lkVApdZleFjiRrA?=
 =?us-ascii?Q?LVSsYBpHtsePk3JgY3gNZ5ac4+XbC+EB0ofcgJCx/I2WvOVNkWFb5fF8XSG8?=
 =?us-ascii?Q?m1Cn5ncShW+7wVxjnqWSEw3l1mNt0bnqxNDm7OskJyax7DIeAMqPgqVdE9mv?=
 =?us-ascii?Q?pQzq+H7JMhHKc1thvPNkXU/FAYjR40DiLoAlWEmDrqJ+UuIPShO66hU6nGGN?=
 =?us-ascii?Q?OoUc1JZPNvg5hl3Pwd8GhykS5hBVNznIBVhjbjNRP5c/l4m7JdKRiiuOClLO?=
 =?us-ascii?Q?y3eP6pUCbBeC+2sGOpn0tzLi//xby3tVRTnn027LcY4RQwpZrATB4twvVDSm?=
 =?us-ascii?Q?6cdSLLwk6F7/Zc8o9HjwXpm/tjeVaE//JiHRS816OUZ7QqrRYbXQer/9Kwfj?=
 =?us-ascii?Q?oSkVMS0+4QBfW97c/fEKf0FFM/fYM71QO3y7rj27VfH4LO42M8+0OPd7xtSr?=
 =?us-ascii?Q?M/zUYyIq09/GYAjqh4HJEdDgLKGQSJ5v00Oimy6anaxQP+d3ofs0FVUVRKfq?=
 =?us-ascii?Q?d7gYIpGM4R/tL65dCw6sCoOP5bt06MczFR0mCy5BhyaohnVhKRe651xZFFq7?=
 =?us-ascii?Q?0xD4mmRc474b5gjVxgzziqGIaKV/Xwd7cPwAMMZ+axG76wQXQrG3BaKowhh8?=
 =?us-ascii?Q?178NHgLAUH19wOJxAlbDbWLBD4Pj0XEhFuxYWUuVvEcVKCSl0zHFCgx8u4WT?=
 =?us-ascii?Q?PzYahZkBB+VyqMkxMPwwVJHcpDEYjw+vqnpB?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026)(13003099007)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 09:08:07.2549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faca6ed1-464a-444c-9192-08dd863430fc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB5468
X-Authority-Analysis: v=2.4 cv=Iv8ecK/g c=1 sm=1 tr=0 ts=680f457b cx=c_pps a=50c+v8Vu7SRZtPLyLAZfNQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=o5mcxbGmrJPhAtY6H_IA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: KpwMYmS4D5LXJsEmFOyS4a4Xv3zK0vMA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3NSBTYWx0ZWRfX2dC8eL9AzrsM 8Mndtyp68No3kJqesFTpOiRscnJFrHIp9TbfbyKJxcX9sAU1F5J0TvlQoQkm/3aqMKGNvrnhZl/ OcGcw0POpNwTnA+oJ9RyakNYHDwEHVVmWxJOzyEVFwfdmTnJeV7wOs/c8zKQR+4UHHQN42uLX+8
 49WT7mJcD3xIc4Zl8CBc2jOMCasILeCA/cQF96f67uQlKfc+ZATsFxu8UCvLS4Gvq4GObxJCQHY vuHIfUT1w/uC+yVq5rNXwdjAHlyq+mDwx2WW9W7rkbh8Rvlx4M98vMzMkTGK9ujMr4jR4+zRgGF jZltMAOtpZqD2CcM4dFsPyY4TjRZtVbv3YVGNrZy3lDYOhIhkbB57kb2qU+lzZSBmN2DXI79AJU
 c16vX9aCIlrpPrInCpmQ26yEcHCw7tXQYA0FASyfZh3xce60NQZefu7OVETDKaat6QAjzTz9
X-Proofpoint-GUID: KpwMYmS4D5LXJsEmFOyS4a4Xv3zK0vMA
X-Proofpoint-Spam-Reason: safe

It's no longer necessary to no_free_ptr() an auto-freed pointer before
passing it to PTR_ERR(). This was fixed by commit
cd7eb8f83fcf ("mm/slab: make __free(kfree) accept error pointers").

Removing the no_free_ptr() avoids the spurious warning
"inconsistent IS_ERR and PTR_ERR".

Fixes: b5d057a86e20 ("ASoC: wm_adsp: Use vmemdup_user() instead of open-coding")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504270751.nR3Ngfrq-lkp@intel.com/
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index a2e9f32209cf..e822979e6a19 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -419,7 +419,7 @@ static int wm_coeff_tlv_put(struct snd_kcontrol *kctl,
 	void *scratch __free(kvfree) = vmemdup_user(bytes, size);
 
 	if (IS_ERR(scratch))
-		return PTR_ERR(no_free_ptr(scratch));
+		return PTR_ERR(scratch);
 
 	return cs_dsp_coeff_lock_and_write_ctrl(cs_ctl, 0, scratch, size);
 }
-- 
2.43.0

