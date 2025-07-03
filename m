Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8992C15A0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582435; cv=fail; b=pZjrAWzxh8Liw7JaNiXzvtuosRchQTUtINvKtGUFCrOGwCPtC4gjURKEOPeXrmX6y+4iH7bbfMhNHYi817+8TN4lBirxQYApjem1WEduKQlgU2L3FJy97KPclGPRrVwTfw794dEECIIKoH3KoKJOKFpdMXv1hFWKn3GR/aEgNy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582435; c=relaxed/simple;
	bh=6ACIxUrkkSNZWQ02Uwh1sNN7RKABLnxhTSZMDBt0npo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DbsaFuE+cT3oXt8T1X23GnA1oaU2R6xr4+f23wgkudYcyWFRBIgLYpl4Q/o40GLaxGbGSqnd4ydUwVudX6aTgTlP/Z8nYTby3EyvVY+Up9VWTWXNfRAdIgGyJYlnQ8hbGHPRo97lH7vGgUle8B3+8v8NPHX1A38QvSOS3+OvupY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aeo2vpun; arc=fail smtp.client-ip=40.107.94.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aeo2vpun"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuZYdsMkTmKuisEeCbNdyBKnzNTMoaxoxyfbTvJEB+ipHMuuZk1FSobNmY5d77rr5VA0IoDbGUwnJGd2hPOw6ZgXBfchnczpDYIOKGYfyb/OzGX/8On9L9N+YlyALhMBvjRcZY2xOiNNH/jPMNGGeuyPUNYTfqkaaMZZynyRUre3LrcORpEMwkYorEEJDcGXwQ/8iGVRZyjWNU9+27c9VO/CnkoVcxqUolL3RuQaCeULrd9h3RHWio2wsCMgX7eEVzKm45m9JdYqm4gkztreJKKc97ZV9Nlj6hUX7XTa9O8HpDd72uE2xBaZ6hA8gRzBPLwxPu4gF5x2l8PiR6e0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJEjb9plpxAstgFIRiHQ8gawn0fkoGKxPeZh65T5x+4=;
 b=VHTHtFRgcqthDTqbKDJYP0rwYxfxeggq8zoxCRf410ph1Zt+ijCjHi3Qa0YYFBqNpABNFSZAz1dDCXWfYap9ZZxGRUegfbCnrz7GMAnTAql85Qw1BI8IROJsvLFUC6vSIVOwAEZtmAywZTdHIoKUX+SCQ1+TOum2dZL5OP8j4Imks4o2sjTxR8bhvhzZyYFNoNg4KGk4kJcbLHvtwywwMRbyIko7KWcwGxAYz4x6ausJ6v3bkfs+X057Lb9zyY8eVkQu0oUFGkLaPXJHTwAO1eNq9oRlaE40rTAi/pwgPL7xgDc+KzEkqO6TdgqAvv61fVcqgjLnxRI7IxQinB0CDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJEjb9plpxAstgFIRiHQ8gawn0fkoGKxPeZh65T5x+4=;
 b=aeo2vpunUQ/HfjuF27d9vjsl6Xcnk6Ufl55Y4kt7epwvSMRg2wfkro+MmOLhBzfdwNauts5JfM5ufnb3nme3XpW98Tq9X05gQtN7iY8CKyBr9GIAZgnGaHfVaF0up3RfhUGjhNHuBusBi3w6fPgGNXERBHwEjSqOsdEYGnBfRgc4tX9Pm9k0wWffI6HTHqMGa3kIUcgbHFyfKUyoEtC5DUQYd4UV45aSz9IJzblcOLzb2+59yMfSujnCtqf0cP6DLU03BnZiKPaFBOTtASdTveM13XqnO2lreuQRfaoiY3qZ7KSn3Lez/wZfVBBY73fDN7ATmgS+/UStiVmAQOmevg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH1PPF189669351.namprd12.prod.outlook.com (2603:10b6:61f:fc00::608) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 3 Jul
 2025 22:40:30 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:30 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 10/12] selftests/mm/hmm-tests: new tests for zone device THP migration
Date: Fri,  4 Jul 2025 08:27:57 +1000
Message-ID: <20250703222759.1943776-11-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::27) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH1PPF189669351:EE_
X-MS-Office365-Filtering-Correlation-Id: 4801e7db-5b91-4662-76ae-08ddba829d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x+w15RKXAkyC62xB1pmTc/xZoWpdYRCZeS70dLAiEkZt/LKRTVXFg2K0ChO1?=
 =?us-ascii?Q?JuChftwp4w3MiMyJMUD97GZ44y52ysDgFqZu+25yWiMP0ef3zf+SI0eN8Zww?=
 =?us-ascii?Q?r2/DlhHS8CfeR2iSNuABt/pJhwToPYUBNMGP5hOsyx0jMrYvUUKoP5+iCPBo?=
 =?us-ascii?Q?7gW2Bf+NfEOYFVRUiSQHKXUF7SxwJfy8rd9TeWeEfTH6FGJPJTeQ2/nLfurS?=
 =?us-ascii?Q?GqJ8g5vVPFFYqz2kK02tjDQG4A7vYU90hzOPiby4j94f0IH1mZtchM/Eok3d?=
 =?us-ascii?Q?5WUqy/u0ffVnI/w1kFDdreyuUTXQgCoOgH3RoP5SmIrOSDdeXpeLVklu+Jz7?=
 =?us-ascii?Q?GIkagQGVe0KcycyGPXefKwvCR+OLtSogHZZr20pIIBLjjbVDjBo2wZwrZjua?=
 =?us-ascii?Q?/one68dMv+xD9wTTmTYSQEpqBzgRR/jC+YEYtaXwRS4DQ7zEFtiqEINj+aqj?=
 =?us-ascii?Q?uS3NAv6696RbJObWDmgQcCOtM3FzkWOdaU3apvZOlpwJcS0zuCx+sMV4pZgx?=
 =?us-ascii?Q?VGak46xC4opX2VPpZUY2Zl8RK5f4i4sEB0cwhdBEVMbgq75BT0FgphA+AxZf?=
 =?us-ascii?Q?ZAUgA8g4JPTaW0DZyciIww0TEPyOu7geqr3hp7qMF0AbMzAv0A7IFNZnRlkO?=
 =?us-ascii?Q?R6G92/BgTi8oVR2Del36teQf/etjqrWAD3q14SvL/fKXf6gMmXqF4WwtkWkI?=
 =?us-ascii?Q?SUZ3c/LCitWzhVE9nWDe9MJF5kg/bGmeDQwgJxs+wjaiqQHjMqBM1bhLvYFm?=
 =?us-ascii?Q?nCq53q7N+BC1KqBmCOhPPFzjszRaYiQphoyw5Wr1opeezYRtkhuSZeiIz5CF?=
 =?us-ascii?Q?RhLSck5yB+ECLiW8UE7YsyF/Oyy8k6v9agLSGcDCVML/fH7c5nwbYfcqalHd?=
 =?us-ascii?Q?pGJdFVTSVGdgm1SiLQiXVADeRXDPKOsE9Dj5FRj5kKG7hUou7BVAJAnM4d4a?=
 =?us-ascii?Q?gXDaUdSxx7oGATmdgofdPpnPKzwvLTfvIo3R1z3C6V7QCiGpbfGP7uZcYPWf?=
 =?us-ascii?Q?GRqLw2fcSqdQREm9gTfoNlY102yAcCkU6nS/5JzzYUSGYGkCx+Y9nx/Lso8I?=
 =?us-ascii?Q?7y3deG61rqnpAwT+0ZGlEv67K7+Al2JfA7Lt8kuwwUm3XyqOuFT4pJywpiKS?=
 =?us-ascii?Q?cYh2qeP0NasFQQ39OTMwy2jmKXM3ku1kq3bvs68IOHpc8JNe4tdaVx2Zj+Go?=
 =?us-ascii?Q?Mq0qXq2k6taYDyeGHAoId5IiD9N4pF2FU4Lp1gY4mTLvuvUHJFF3Zjnugb6V?=
 =?us-ascii?Q?gZCWxq9IrYcAlH8n/pFG65tjCX+5xAc1bFx28GTeFqLbL2VsaTw9VgSqG8AS?=
 =?us-ascii?Q?JqC/PUT8q+lU6uHfjpMNKSGLT1Qe2CWc0I6Q2hasOgg5FPYpdg99LWvJfqAB?=
 =?us-ascii?Q?/STG6Q+9mXRT7mgw16vxpb/czg/8+a/kIA4SDWdTjaDIzXnYvw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uaobjzxeVSQH8P3wjPYHBFS9rhUgdhnuj46yOfSMZ+77PoIUZrLpf+SEoutW?=
 =?us-ascii?Q?57Qdn0+XpqLeeIeO5KWv00SsFZFxsca1QocBZhaQk6vdGtOkteObDpF0TMXh?=
 =?us-ascii?Q?Ovi2FYon7FQ2gJ/p2eVjpeTEoCgbH1DMv0p384Y0iJngT9qyrOzPunNPf21r?=
 =?us-ascii?Q?4jd7hrEm5oGs7j3C6woO5nx/zHX3dZTxCDfpSYW48L0Og69xrrHCuAmi8EAg?=
 =?us-ascii?Q?hpXWeKn5kYRjTkCbT+j9RdaUzk/r0q9bAlLOg2EVhzuDolSB5NdLF8G18aMH?=
 =?us-ascii?Q?8AlZwFK1iVz1izklIY3qBfa18fB7P4EfZwEuvL1aCKc8ViuWJ1qsgzUAQ4DL?=
 =?us-ascii?Q?BfIVoVZI0ZXC5NjMoZpI0TpVUGg/O0xhY4G7eMNUHhwIogynbhfH5XfLaRsi?=
 =?us-ascii?Q?KztJGkN16VGrk9qdwdJLeoZEb2T+RalSMi76c0eZGUv9VURwpJmG4Fd8cAd8?=
 =?us-ascii?Q?yhkq0sftA2H1k0xm9qgrnd1KkSMnSw+Gmg2+toMD8IbscnLSklrj7780/5jv?=
 =?us-ascii?Q?hclBB8HQwmkfs+lghefdCxtRY/ntSUaGZJaAdVf1AqJlaWAABi1ftdcivBv3?=
 =?us-ascii?Q?MN3g1qVz0g4sDvV+jyQ8Q0Tamcdau6w2syg6VPywCghK0dqNBUavuwurKaoR?=
 =?us-ascii?Q?a117PLRvxBxMff+28s3bBIu/VPGrHEg1iIBjZ69otGjlW3Tviwia6dvJZpqX?=
 =?us-ascii?Q?XI4p7Iz/qFTSxahiCHVEIndfNYoaCLW/Fh4PGqGeHu5dC9Q+nn9Tuh0v6g0o?=
 =?us-ascii?Q?58+XuMXBMvHku/xsJs4eA1Iovb0f2ua1F6VNKMBeOjI948GtOjCNdqBnMlRT?=
 =?us-ascii?Q?9S+7jQ+KuMD80xESpMINS5h5Ph1wl903K3BygMA3NRaz4U9/gguwV8WVes8I?=
 =?us-ascii?Q?Yggr00abFjEVV9e76j8aCmeYBN2MSM232UdE0KWzEuDcWx4Hrc/0m6sTTOQU?=
 =?us-ascii?Q?WLq881sROdbYjuPiUvn6mqrwVu2NGcn6rsqbBY1QE8ZfLB9+y8J7ocPH8gv+?=
 =?us-ascii?Q?krEUL8l45un5Oj0uvBKRVg6z4DwRwod5/ccfQE+LvNeNlmsY9dm0wvPr8V3c?=
 =?us-ascii?Q?PopjmSdzgmthk4jUgkJM8cvKhUCgiV6ltMWxtlzHIY75bJQZSkVojsKcuoTE?=
 =?us-ascii?Q?G2o6i7MMKk03TentHZBMxvLukWyldP2/wHhV53U81/moyxmdKrha9c6xaY5N?=
 =?us-ascii?Q?dyZfVGqNQR4jYZaltIQKayXbMRk4WlIeGIDiCNaP391iw/qHwbwWUZPolSUW?=
 =?us-ascii?Q?ufLDSX+Gf8P161xckZ3103YcyAQNhZmaIT1mfPExqAEfgBNrpQoGw1IK9y05?=
 =?us-ascii?Q?OV66wABvToAh7nesogSOnL7WtcCx40wWKVSg5CJFPfDcxQd81CuXK1gnA9/D?=
 =?us-ascii?Q?+XoNTS94irgwQJFOTaLEheq/n/wTaiOZ7sRT4yEOzmxDhILce5QziRDvsEAt?=
 =?us-ascii?Q?0JD5Z5Nymn9e3X7+YiJZpuQitQx2xOgPaMIpFszu/M2m0Gy7jNpEUaXUixPV?=
 =?us-ascii?Q?Brf66Cgqu2s7yJPl+m+MncgpFeTqDoOWOl09XVbmQmrEyRDnYrtdqmkIRnpt?=
 =?us-ascii?Q?PowhpSWzYFEquQLOGGgj+QvhyJ11HJ+d8wos3a7C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4801e7db-5b91-4662-76ae-08ddba829d2f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:30.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMWBVF1N3TxGILVnCanWouFb5VA9U6bpra7+Vi9+qMkUBvZdS6ew3eRj43zl2O6Tfq26A9tAq0bvASwFtkVOtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF189669351

Add new tests for migrating anon THP pages, including anon_huge,
anon_huge_zero and error cases involving forced splitting of pages
during migration.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 410 +++++++++++++++++++++++++
 1 file changed, 410 insertions(+)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 141bf63cbe05..da3322a1282c 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -2056,4 +2056,414 @@ TEST_F(hmm, hmm_cow_in_device)
 
 	hmm_buffer_free(buffer);
 }
+
+/*
+ * Migrate private anonymous huge empty page.
+ */
+TEST_F(hmm, migrate_anon_huge_empty)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page.
+ */
+TEST_F(hmm, migrate_anon_huge_zero)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+	int val;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize a read-only zero huge page. */
+	val = *(int *)buffer->ptr;
+	ASSERT_EQ(val, 0);
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], 0);
+		/* If it asserts once, it probably will 500,000 times */
+		if (ptr[i] != 0)
+			break;
+	}
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and free.
+ */
+TEST_F(hmm, migrate_anon_huge_free)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Try freeing it. */
+	ret = madvise(map, size, MADV_FREE);
+	ASSERT_EQ(ret, 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and fault back to sysmem.
+ */
+TEST_F(hmm, migrate_anon_huge_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], i);
+		if (ptr[i] != i)
+			break;
+	}
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate THP to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/*
+	 * Force an allocation error when faulting back a THP resident in the
+	 * device.
+	 */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+
+	ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_zero_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 0);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory (zero THP page). */
+	ret = ptr[0];
+	ASSERT_EQ(ret, 0);
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Fault the device memory back and check it. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
 TEST_HARNESS_MAIN
-- 
2.49.0

