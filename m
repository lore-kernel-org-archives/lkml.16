Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013020.outbound.protection.outlook.com [52.101.127.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EDC20E33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320556; cv=fail; b=g5gPo6Ndkdxpr2OFqXHh3mCmUlKnjnoib0nQTFSB7nar3to4U3OuD8IgUvVwLsfSFhQNokX4FReG79ljHlZVD36niz+1jnzl03NhxmZPCkYgVMmhHZo8jKac6LQ6pQgWSuPazCztNmIAq/h+6ZG0ALKDXNm6CUmKAucpbh3NYb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320556; c=relaxed/simple;
	bh=LeVxay75BSKfZkp52n204OgazAKM0k7oT9yg22qhwUc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WlP9YDI/FZiyDNClVLYo2CsBqzAUDTo56xI192vJSt5f93qvBT0UKRHn5uB62C1dDETSvL+qdvwi6jFje5QE+ydj4rs5zOEOyuDujH2GC1f2FmRNhXRXhSwKyWxq0W6iShtxOK87ZlG/dbxcVxQMT/0yuB5dS8CCT3OxTy8acw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=aGKORqV3; arc=fail smtp.client-ip=52.101.127.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="aGKORqV3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEbPJ1voyg4obc8nTDXpfUzz6dIvOXUcLd4UbIMKi+bSBmsF9T0bdLubj56hE29nYEYNfIcefzF1PbYHviJbqMNoUGjQwqRmlYbOOVoamHFnvXAG/VJtZwjCF5yKTriaNwCpa0O4rNQnbKrEUxtQCA3nmcV7XhUNcJI0SgRSVWRw0bkqepGjQGDV1M8miBbuebL1aRQNE81pXlLt4xvsFg0Z255aHL2NWPlspXFm58pcPg/+UjsPwtIgNT3yZwoZescH6IX3yAtARaFJTJ+shQeU5hVaV32c8/mF4Mn2lA5upWD3l6gMIkaP8IpVs6vGSru0S50h8K/A5h8dtMQXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TY+PEy82v9O4zRWJQG765JyjciwVGIlA/QXKE8A2DGE=;
 b=s/8ghswFQAyEszONTBsvwthhcpBXzFK02g92zzrMDegOVn77G5aJCqPBsenD+vjsiY9Q9LLT+dgjcheg90Q4NMg3mfdL5GSp1wG/4e5zxjGVOpeGJbBKNrUrOqpsbHki+LSUZt/j39LLX0XT65XemGZ55g7JtiP6Zi7FOklxAB6DnafWDbEozJmG0o0af8ti435MlYL6PnsLkIBfkPIeOjy11DWbRLOXdVfh0Ec6Ti0XlJvJzFGi0IuJyKBZm0DOGKn2WZU1CejfOIwGYx2uc74chrd+l08lhFi2SAkOF9inJB78Q1e1rlYp2IQrd4k4cipRoZwYOcgxQc1Mg7CRTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TY+PEy82v9O4zRWJQG765JyjciwVGIlA/QXKE8A2DGE=;
 b=aGKORqV3BoPkrBiu+6Dtn6ckxRSpPYTRA7Opt2V1MdDR+aYf9S8jhsSfaLFM25mDvBmNGRHA+QaazNFX0A2EmzH8Ih0fP8BWImRYt39WEKZVW3Jqto5G/1CfB/1GawspRwOMi3RdTH38nHUPN9XE+JV1d+qtPu1U4aEeharlbSUa4IFQ2z/wSeRwYvd9ODBLEKxcyrkU+N25wsBwz4Cco+KQgYmHVpZI+BADVPjVmgTv9ry2MHS4k26OVopHscs0azYVM06ZjS2oz0848ny5siw1KsV0J+p4hLp5KWl8uFAaXf4rklRN2DiID+wZA/0UqnE6MGdXfbs4UQz6jdgn2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com (2603:1096:400:1ca::9)
 by TYZPR06MB7213.apcprd06.prod.outlook.com (2603:1096:405:b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 08:09:10 +0000
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::9043:7fc:2b52:535d]) by TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::9043:7fc:2b52:535d%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 08:09:10 +0000
From: Yuesong Li <liyuesong@vivo.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yuesong Li <liyuesong@vivo.com>,
	=?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] staging: gpib: hp_82341: Replace manual comparison with min/max macro
Date: Thu, 19 Jun 2025 16:07:51 +0800
Message-Id: <20250619080822.677662-1-liyuesong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0363.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::10) To TYZPR06MB5026.apcprd06.prod.outlook.com
 (2603:1096:400:1ca::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5026:EE_|TYZPR06MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: 3570ff06-f9ab-4a50-ce6e-08ddaf089155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?73cCiGw5XBiym8+rv3CTxT37CGhEfJm6NlB6JT/vDhuZDIb5NNN+8MMJplRk?=
 =?us-ascii?Q?5A5dGn79MFmB1Xtx3O14szeHnlk3HopjH+S001UGgJzt5Riqv4jXXtRsqKLI?=
 =?us-ascii?Q?JfTpdH5DJ8EyxgRp1gzu1iKco8eZjwIM6vO3FhjO8fmB7f9rPe5+Z0AVwz/c?=
 =?us-ascii?Q?xTLgbLvfa7JgKihTNKnWaXDPxqFPVZZlwKvzbbHqUFRhAI5cvPGvNPM4ERff?=
 =?us-ascii?Q?l+bQbA7019JNNLPFb1DaB8VE5V4xvWoyhSMqFNdpjdD3WcAwQ1W/j/fBOf1d?=
 =?us-ascii?Q?bzMgHKKRQ5bj9ew9qyCKM9gc0mNMAfyj60H7Rg4wUtblg91ErDHcyR2Iy4pI?=
 =?us-ascii?Q?vJgDVH2cOYYBxo5S3JHpfYJ27PD5glNf56RyCPK9AqBZGLqtTy7a8eBCzwHA?=
 =?us-ascii?Q?wLtLa+ulArX8/YO+kv7mTMJNwyfxkAMTeSxyNNfj5qOLfwkKySyHvMALKOmh?=
 =?us-ascii?Q?xuLRAMHgXL0Ku0qmsNrbE9L7PKFxxq5j9ey6XlKXTLMV2oe1QHE4r0wzhszU?=
 =?us-ascii?Q?8DEGjHcxmYsSs0jByL2idI1GDS11PvdAyQwSkSeibuSzekC7iUpPQ9dKnb+D?=
 =?us-ascii?Q?rXACLMTiPCjHurfxjZbVgqqqLMo8c6wHcJxD4C3UzV7ThW1o2z+3TXZl7OzR?=
 =?us-ascii?Q?NE2ePxpLUii2qQf5eBlMhE6fnALODY1MhyfooRnA++CXDAcSDJ1tIDmlVxlj?=
 =?us-ascii?Q?e66rQujx26wKvx8RCk/7td+LKnEqJ55D9DMRqTPgvQphYWnaTRKDWO7xaBDZ?=
 =?us-ascii?Q?SuBIg+8usGr6J6lLj08aL7cSXmIqonVorRzhpt7ObfayG+zoCIYWU4VsGyZx?=
 =?us-ascii?Q?UN27/GYfLYmnlAIbZS69AU+Z/ZDmz4ubMH/1vS2Xv/ltISjPC+6v99HdYUj6?=
 =?us-ascii?Q?HhOOx8o9h6LLNLxIRim7Ofg1MQn34U/WURhCkiFcYZGOpfEen/XpK52z3JJ3?=
 =?us-ascii?Q?hUOlgAYBr2ZBE5n1JpuIRcSlOs55GwlsBxpi0yiMy/hd+XlCbfUwSOEWwQDa?=
 =?us-ascii?Q?p3SDVwhPpXDOliqmgRfNa4N174S+J/DcHPwNA3vOZ1XwzUv81YHpzTuW2m1N?=
 =?us-ascii?Q?thuXYkj/xLZcY1xfksBcP/x6p6cSofrcZZr38+X+w+4F19mEsioLeJnnkpVQ?=
 =?us-ascii?Q?gUQErtnBpo7JtnYQ/GkusJVTYPSCRctWwdp34Veaw0/Yd3V5KxJi4nlRJHa7?=
 =?us-ascii?Q?dk8G06TbN7kqfVd8RuRvsPLBx+fGcyr+T9D2cG8l5OtKTfojCWzR/rnWnhx4?=
 =?us-ascii?Q?4lOhNrtpJMvvaNdxNurNVhYT4r8a4p/ciOP2H6kVvYs+Osx3/LDI5YiOYidP?=
 =?us-ascii?Q?09OUYj4QC7ZVpsI4E3yFH7WFYd8rvSrUIUz7hwu2aFz/NwQFqC0gtGNrxHz8?=
 =?us-ascii?Q?CLTCLL1b7WtJVUrOXxQC+mvE3yoTUyUhfQOykTgNrbSO5738A+0uBPq8eQ4c?=
 =?us-ascii?Q?ri91XmVKWm3BIuwK+fFSVI5JgkPlvckB1IgCBvPaPwpQeihyf9cndw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5026.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MJcvCzSvEptPCHJeDVtTSfOJdWacL5bVo50O+eOS0PyEsmUrlZyNlV3dS0Lp?=
 =?us-ascii?Q?uoLlY9Knp2xhxT5aOzYcqcVIykvVv3wJ2J4GDqwghKc3+m/7p2ZUTRa/2ONk?=
 =?us-ascii?Q?kIA1DeZ/e+IKYcbX+TkBpBmHe/6MaYuKrqkKAe5WXFA2I0PE5ZgRb4RTHG3o?=
 =?us-ascii?Q?7oM3M2Gx9I3w6h6b1vDKUyC1lJnEzwjjf3K+KDvn5OhUZqU9muaShpxpJpAr?=
 =?us-ascii?Q?X+YSuzcZRCQQGinVb3cIXYn6YTCOAxrZ/xpaLcQsuD4hymTeQWc+tzthj/cI?=
 =?us-ascii?Q?Ecsr2bFpOfULD2OMsr7eU9N8IoWla0aIfi6s0rLRfKWDM56eOw3Y9P/LaH9z?=
 =?us-ascii?Q?MnKwgzr7GV6qvNoOk+L8H5pjgvQbJPthyvU9jCXB68fFJnx3toplDgc/aHI5?=
 =?us-ascii?Q?oY+nw6Ll+brzq4r0hd/nOQ2yYZjcSXkqsMNoKlnsDmwNWmb5SC8qMMBAwFBZ?=
 =?us-ascii?Q?cOlSs+4QVruBbY4zkQIk+VLeTifs8CQyCzgzcVvIbHjM6v168OAerLRrvrRd?=
 =?us-ascii?Q?3oruo2vrCl+PgjhkXIivNnUHmS25cJWUDTqwqwkl9waUCBVHPDiVA0Hs8zBo?=
 =?us-ascii?Q?5fZFauGJ/OecEEB3iSpzPgZ6HA3AKYbIoHDwEWyDZJR/YUezKw2iM6aL9N/a?=
 =?us-ascii?Q?PnA+murKLV568aJQjLqWd+8WIm26oVd3RLe8KQI0Xj0qvAbSZURz7cT/+dus?=
 =?us-ascii?Q?PUfkRgXzfcrOGNlD5s1QzvcBICJGvtA0ZUAHYIOwj9/LtcDRE/I8D26bTOUH?=
 =?us-ascii?Q?2JNfQtag3nzQG/CfWYGfEtPoq5sIFGhbZ6tUn3hAWd8IJvabhU9SbissSajF?=
 =?us-ascii?Q?gdY6yZUPnKEyiat+YnyI6s45MfurLhSANadRlqymqhYX9lbQDKSBjJBFLGc4?=
 =?us-ascii?Q?CTucuVJ/5EOIa4vG8J05blOLfx6tdGZPPfouT6lMoBu/l7Q4H4g1Wj1lm9RS?=
 =?us-ascii?Q?WVJwVa3o0BMTz5lFWH6RYAFIKzV70DEUwygU5MVEm/MvE7Khw7cd5PYAoGsz?=
 =?us-ascii?Q?OW/wuRtWz2skMnf4++0DD2I3nB5p+K8ydeoJGgbPt09WHiPx4aEK9ORXWiFb?=
 =?us-ascii?Q?Po1lhPpmLCho5H8D7eu106jrnKeFCC/bWwaGHndMPPfxFQ2/MI0H5sqdbI+x?=
 =?us-ascii?Q?uLpHAy5Cvq221q+B6+bk/32Nu+uqNmSMRfDBD24DGnYr52Zr/zNPHsM7ba6V?=
 =?us-ascii?Q?sxL+aRkwasYR+iAA2mCKhybz/A8DuZYOFes16G42MaT0sgWWRY8A3ofu+oqX?=
 =?us-ascii?Q?m006Kbw8QmdG9RRQnK9ZqJupSRJucyoBdUHUwW8TAbMtnRMPNvIzzsj96Z2j?=
 =?us-ascii?Q?3xH+ZGFGwOWYWW9TxMynKFG4OIy8jxwJKH8yBXpvYeFCTVxxBmvqQk2Z/FjM?=
 =?us-ascii?Q?H2YZmnUInhX8si6D+brVB1Cl7gbClhXsshR+f/5R8Eem7CG3LkLfGTPWUxao?=
 =?us-ascii?Q?NgqlC5Zkf5Sn57EH6D+nUQovx4BuEn0pMDch3KoeFiv0aubAwJ/SIs0hRzxq?=
 =?us-ascii?Q?FNiA/JMZbiNE1n4YaUlCs31kBjPeC7bLoQiepRjDelsbS5jraw6Evc3kIt84?=
 =?us-ascii?Q?c7teRKvrSvm+VCIM3QtqTb22r6MH2rhxvwF8zxBi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3570ff06-f9ab-4a50-ce6e-08ddaf089155
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5026.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:09:09.9315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXWW2VPmAmvAnIhpX04dR4gx7qaRaL8lksUAUwIxxOq88OuISAqj1HzhsRnvmH9EPLBrw9KLWjOd2Nwh2VSXjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7213

This improves code readability by using the standard kernel macro 
for min/max value selection while maintaining identical functionality.

Signed-off-by: Yuesong Li <liyuesong@vivo.com>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 1b0822b2a3b8..e5c1997ce7d9 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -79,10 +79,7 @@ static int hp_82341_accel_read(struct gpib_board *board, u8 *buffer, size_t leng
 		int j;
 		int count;
 
-		if (num_fifo_bytes - i < hp_82341_fifo_size)
-			block_size = num_fifo_bytes - i;
-		else
-			block_size = hp_82341_fifo_size;
+		block_size = min(num_fifo_bytes - i, hp_82341_fifo_size);
 		set_transfer_counter(hp_priv, block_size);
 		outb(ENABLE_TI_BUFFER_BIT | DIRECTION_GPIB_TO_HOST_BIT, hp_priv->iobase[3] +
 		     BUFFER_CONTROL_REG);
@@ -195,10 +192,7 @@ static int hp_82341_accel_write(struct gpib_board *board, u8 *buffer, size_t len
 	for (i = 0; i < fifo_xfer_len;) {
 		int block_size;
 
-		if (fifo_xfer_len - i < hp_82341_fifo_size)
-			block_size = fifo_xfer_len - i;
-		else
-			block_size = hp_82341_fifo_size;
+		block_size = min(fifo_xfer_len - i, hp_82341_fifo_size);
 		set_transfer_counter(hp_priv, block_size);
 		// load data into board's fifo
 		for (j = 0; j < block_size;) {
-- 
2.34.1

