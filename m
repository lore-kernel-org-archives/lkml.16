Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2126.outbound.protection.outlook.com [40.107.236.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2662A21516C;
	Tue,  4 Feb 2025 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685619; cv=fail; b=OWKlsJPdqIk6/Gr/CBkiroT8RbeeFhfFbGdk0/mHApINVirWmyMxNgA5LxVswLed8bsI+1kHWN4yNdQ76WcH40VUBeH8CQMW7kaZmkuRnIuec4xOaVkjgmMbqNJFQlTAvhAOAk4joTG0vvg83kMiYnSXJHLEnH4R89zvnnvhYyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685619; c=relaxed/simple;
	bh=pBArGccyb8kjuSGmdQ1UNM9QO5IdNDRAM2Kp/DBVT6U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YMNlpZmu6aHWaQBitttIaspatdI1aqxD+42XVsyVHZWk83ko1YrPZ12CXDqZEvKhLIoDaw0Giwwj6ruAZ6hiS/W21nkp/S2HkknbToi6cYdX00+0zzB/IOE5j6s3Fx5vRPoagh1ovusL6nGeKG8Ypxo+OCncSzJRsxbsm63oqvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=G5unYY62; arc=fail smtp.client-ip=40.107.236.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="G5unYY62"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3QMKVUcSyPjdR3KTNEvJh803zx0a4QkRJBxu9xE/sLZKtk2YtwEJRIC8Eq0FXHIwHWx8cvH2h2yvLSMlxkfB1ruq49WG2QvTxM4rdnY3Qn3XLtPXg4xCvFtP4XZKqsEfOgTKckZ3O/fRNcYjkixaNez5ly6b2izuhwhDxZY81KJ4pfoo9r5FYQOJ6JxDSFGUd9S7KYW5mGr31qPLPrxaDvCUgoV6VniVvbaRfUtNmsEnc9HhEBualOASgjhRRloIJd+gJ8QQYRhWtVF9VnIPRbEwlRtxba34xlk4FM0LootVl5mSjpxZML1iViL1xiey7A4WojMGktPbpltZqG/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5G+yIYu1GG+TDjFPSZ1tRTYwNmnlx5JgFpL4aUX+hqM=;
 b=EloJBBArXmpB+pPtYpEFrpxsWDM1yJHeliPNUjl1PYjNYfM1oAVyT0Z4yt6VRuelhuj916OSXGnu7EDnnj0hnqO74OJ61Rry67SPeDWtbvOBjKf06cwSOR0AANoFVfgxU5QLYQdg/mzPyuVqXtOCtLs5D9mQBKXDr+Z8Ame8zFLpkCjrjLi8PJlolbzwF/jtsbjhFybDjY5lQ5pEAAfuEoVjVZuYhTgS85w+1WHaKVobKD3yyK5RqRk/w0qbUDTAFF9bocoxzcs1+EwWGGOoE1rmnZtmye7vZBNH/4an2l3OJMJEQh/djq8KepMuyO/3vaYoc3mACblPCOp0tWm91Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5G+yIYu1GG+TDjFPSZ1tRTYwNmnlx5JgFpL4aUX+hqM=;
 b=G5unYY62eC4b8fGu76UW5VsSoSf+akaanf1ooPYErP2Mg3HouInQuFtMpgxhxi+VxFQ2KBdKqa3wgMxZm1bqBJajRMNT3pIdyNyjC9+fXUgXMVdoVr7Yt03p0b5KtmQ6La1Bl2ejImQMuvByUNIy0mN9jmsNj05Jpv+rml44kOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by LV3PR08MB9507.namprd08.prod.outlook.com (2603:10b6:408:213::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 16:13:33 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%3]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 16:13:33 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rockchip: i2s-tdm: fix shift config for SND_SOC_DAIFMT_DSP_[AB]
Date: Tue,  4 Feb 2025 16:13:10 +0000
Message-ID: <20250204161311.2117240-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0150.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::11) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|LV3PR08MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb7991f-e51e-4c7c-608b-08dd4536def7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Ggq8l24BKDI3o5nCnycr4/sNBOkZOniPw2aLxrWute/9lit7oQY0dVxmcQg?=
 =?us-ascii?Q?dAqZabybxk2kpGewQ9vHLV3u260ZSHpIuSySrG1ciEiS7Tp63vyxC2cemDpM?=
 =?us-ascii?Q?Y2KfhXgN/bQ022u6sKmVf7X+xBekuBYyW9nfwHrviAIqbPp+z+oP1fOJxzWE?=
 =?us-ascii?Q?0U1J8puJEJMbmH13Blf8+auWLgNlC32SyP0tH7BlM+KhK6nDCwEwClVvet7T?=
 =?us-ascii?Q?DqSn4CFykbtq7hCzJOq/S0ppkgEfb0KHptvPuOQFa2dblVRqeAuw639MgV5z?=
 =?us-ascii?Q?jBwF0GK1iu0W0O91P6Hglq6uiOtawrpVnoNnVYl1ezwNzDbDplOQBSaNd4Y8?=
 =?us-ascii?Q?FOciaLWbOszt+Qj1xfElucJctWuzKdu/ybDGLsqPElF+Y2SdtGAxjunX6d5l?=
 =?us-ascii?Q?ot/JHJSz9dfPATWjFm1yGa+K6Jrv2WD5sT4ScENKcPmtWkilDH7HkgtkjokQ?=
 =?us-ascii?Q?DacthnPYJII/asLDhP6m8Sjb8Ag2R6rR1RbdMFweTCBhujdnew0YE3omlYda?=
 =?us-ascii?Q?FXdOch0n/YVzCiZO39bz8UQDBnKHoVSxQ2bYkG6b2YxLtxJ8fldwm9F1SGrr?=
 =?us-ascii?Q?sDdkdJtgFZ+LNBVH46bqLLqz9QDrJ69/tepRsDTZHjRWKnB74n4MDcwrxieB?=
 =?us-ascii?Q?kTpvDWglDSQIcz+39Crnc8dq9NXDmu5xqeESNhHJkxGchuyTlNsaMLUw/PAP?=
 =?us-ascii?Q?VX9EQ1s+KZVd8kICo6MNfIK2ZeOQ27lznbmM8j3VIzWFcJyMemI6LgAf8bhq?=
 =?us-ascii?Q?dweBqWjftoYau+HnFdt+RC9taGuEhfo5fijvWNq/kGVDYmsYT/GM4AEHs4Zb?=
 =?us-ascii?Q?Fl5/nwtuiZHzSbNf1okpPs2rwjRWk0cr9/GzKXJR+7CH6SUlt80tT+/T7Sac?=
 =?us-ascii?Q?SFunk0XWGv4GP4wFWguuGgtNpz3+z+up29r1NVjdSI+fR1HJNfoGiyz/sw+w?=
 =?us-ascii?Q?DvpFte0fuVx3e48t8oPneKLxyZLaNChUufNTcxUxpGP/karC/JyAOXGprzAm?=
 =?us-ascii?Q?7BToZB9Zd/hPVcx8OEk+FK3OfYzDBd2LQsiawQ66V01ghf22MxbWyZDznLjZ?=
 =?us-ascii?Q?oa8qol9sD1CJ291dsAQowu2soc/I9HKPEvBrzB/ZJZNBF370H4QXmSTeH1F8?=
 =?us-ascii?Q?5ZgSVU5qoVUXbtKXbp4DhgrzVcWHMvOvrDEgbI4rlsCdP6eeJsfW2LdngWU4?=
 =?us-ascii?Q?xefcESLur1GWMGSmX/6kle0fjsqHOMZMmQrR659T4W8iW9miRrOu5C9hJ5eQ?=
 =?us-ascii?Q?B3DgShnnMZDyjis3eCs5yy247uotTBEQCH0+4yQHT44Cz2y4tjV7DokS5Ai/?=
 =?us-ascii?Q?IILNXufjg9NBNLohmHh+iCAllinbR5J/283azW+OcC193edT5p7lmqk0drgj?=
 =?us-ascii?Q?PFsSvkD6sRvaQllGCmb8SpsW3omOxhYDn6mtIMQxSTJNg7nTARtmKGu4Hx8k?=
 =?us-ascii?Q?CEWJaT56B0hhJ++iM+6gjQRDifpbmqQn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+1NyI5p4XVgsiWOjAiubITRjT9S/bsLXRgWNL07VKuSxOSIozhsV/HeWsPWd?=
 =?us-ascii?Q?kpszyrudccPzp7jFisEIAdTGk7GfluED1JdLuz7IrfoJg0UgGzJasa4FZuBn?=
 =?us-ascii?Q?DKNfXT/FuXQ7blFwywg8hzg2Gu452Zif/O9ShXLgCAheFQmCZ+ZXqVavz6iQ?=
 =?us-ascii?Q?reD2yh3bsKH3NgjqPbUA4JUlGcWTMRCwiDuJS5WHwY5YAFqVA/8PuLeD5EFi?=
 =?us-ascii?Q?THiR0tAte+/QRoTvi3wSuNZL2cGfdGxRHEy5/q1e0ZF6Nt4Di0lp0saas3SM?=
 =?us-ascii?Q?MYAiTJx99Z9ZnG/XFd8XLk5jJuf9raRunDBauJySdg3LL2Qm8b0zn6RKwRZk?=
 =?us-ascii?Q?Y5BJFpZ2RwEcaIy+XAfWV3KL7Ww7etXaRZszYzWEKhoajGewksQbAD+yTjOj?=
 =?us-ascii?Q?fpDCX0MUFel/VJIlCR88LESDDVROORSDrl+Rg9dxyoWAIuBQq5Dx5PnGNEYK?=
 =?us-ascii?Q?eJCqHpTojyEYkEvd8XJkZx2Rbxwl/JbKdz2vr08yFSWk1HvGsUEcaTYorb73?=
 =?us-ascii?Q?a/J5smTYKFvOxRtQzZvbbRWtk0Lzv7kUlTzIq2gqNY3PgRavIZ2hvonoRi/o?=
 =?us-ascii?Q?EzIKKTVExR8DfBPbmIIVJr8FOMM3wugqfJVibdHPwkpgUWdnQsyUsyFb8/dK?=
 =?us-ascii?Q?bNELYFNgpeE0vD2gjbgpV9LAhHOvFsffNXeiYJA57axzc8ECkSB08qAKq1dI?=
 =?us-ascii?Q?+N7LE3Qyj4ptVlHRsunnNfjcJqffGccFyb7OLjuDZrJC3kjoFcWGSf6ZWSTf?=
 =?us-ascii?Q?HZUZLxI1WtAswqsV3XRnGbgL1+HmEHnbR2/cn1g5V2eMCiKFSBB42t+P1127?=
 =?us-ascii?Q?jU4fMKsoCGtG1VH6hpZoSOIB+xlg40NklwN1k/cT7sP80iacs8sStqgl6zHv?=
 =?us-ascii?Q?hIqyikG4K6BFgOy7vCC7EVrrGY4zDdsjoVmLN6WAPQQHH5gd2VMpPSNXeWLM?=
 =?us-ascii?Q?aYCweHMUk5G6kxt6ckzn8m5KtSb5lbcf7bDfIPqVWz0GSPw6oFjCOX2iMHG4?=
 =?us-ascii?Q?BscmdhN4Qpn+1uYbX04Am8crIYRD+7f/5PqoWlqfC91Zqak3z/Z1GMDJMqUn?=
 =?us-ascii?Q?MA5aCFQ0Noslp7ExdfKd/kqsmWVe2cC8lreXzbxDFREzZhqo+GeyVYjixd5F?=
 =?us-ascii?Q?2P0Wf8rjAjk1gC4tfunlINF4zaBa4eQQ9dc7FKktQ7KIDFRcjKeoyzEY3Y+e?=
 =?us-ascii?Q?BS8AhQv1+kjQvCoxzCNZAxt8SCDMUGB0bvUMtmMT5yyezHjWif3uMew4zTuV?=
 =?us-ascii?Q?BjJoNzKL53RNi3yyDmf64MfjJIoTlIXsxvlLeBQczDgG27XMEWzHqdyM5Klo?=
 =?us-ascii?Q?dncWdPscDC9zmxtPcbfCPCfE0S9ut0vKG7ewLecSyBfwWMsvn64DGH18miLB?=
 =?us-ascii?Q?AgsQhPL8gCS6Z9IDcts6af9INPc6oOdpOunl6xKZ4h/IqvMt+wntKu/TNcu6?=
 =?us-ascii?Q?pp8/CyzupZ2qRrviTsbbnuHY8WEJJQ1E+YMUZWUGYJGsVMCQVoq257WybMRl?=
 =?us-ascii?Q?JKqPWYoCWkedOpa+iDlDFmLHVMyPXcNaIjoKqVKEPSjRbKNSZ77M+hz8943i?=
 =?us-ascii?Q?eWnOIV9vT82IXrhCBRmuI/PquOLFWIKpG7FU6arCOy40LcodxIV5GVrjal+Y?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb7991f-e51e-4c7c-608b-08dd4536def7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 16:13:33.1419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ubPjOLFLx3vrjBKt1xTSqmZqTJU91odH/TOm5bK/Pd8+3Xrf4YRRE7Hvkwz+X8RTdhl/So7HhMyA4XQjwyrUbEGnIIAfvgtZ9+D41FuEBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB9507

Commit 2f45a4e289779 ("ASoC: rockchip: i2s_tdm: Fixup config for
SND_SOC_DAIFMT_DSP_A/B") applied a partial change to fix the
configuration for DSP A and DSP B formats.

The shift control also needs updating to set the correct offset for
frame data compared to LRCK.  Set the correct values.

Fixes: 081068fd64140 ("ASoC: rockchip: add support for i2s-tdm controller")
Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 7f5fcaecee4b6..78ab88843f861 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -451,11 +451,11 @@ static int rockchip_i2s_tdm_set_fmt(struct snd_soc_dai *cpu_dai,
 			break;
 		case SND_SOC_DAIFMT_DSP_A:
 			val = I2S_TXCR_TFS_TDM_PCM;
-			tdm_val = TDM_SHIFT_CTRL(0);
+			tdm_val = TDM_SHIFT_CTRL(2);
 			break;
 		case SND_SOC_DAIFMT_DSP_B:
 			val = I2S_TXCR_TFS_TDM_PCM;
-			tdm_val = TDM_SHIFT_CTRL(2);
+			tdm_val = TDM_SHIFT_CTRL(4);
 			break;
 		default:
 			ret = -EINVAL;
-- 
2.48.1

