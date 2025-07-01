Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2128.outbound.protection.outlook.com [40.107.237.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6729D0D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 02:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751338000; cv=fail; b=ZhCoD/FqK5Nadhg5QyhHh62l+ozkIXv8TpXjByj7ouV56k4G+dnKgEnPaQmpdZ20EZKYMFMl/a1ofLFLeJTddTE1ezHCIYM0djWkD3hPte44b5jdo8CLVf/GXMHpVyLV1JG4TfwdU3WZ+RHAv1QBEHU7coYxwh61EwAAJCuWZvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751338000; c=relaxed/simple;
	bh=/Q2stqyjCUUFjqBwhcD2UbzsqbjWS1EfrJcF94GwPQo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RNhzJC34LY/LMKHztfpuz7yZ/8acDhToH9KZPzY5AKQRorDwi8y8qt3ygEeb/prpHX19xbIj+EFpAFZxx6xOgCarPWoSHXoco6OVbQrDhM0V8rlAIaCy3kZn+yD9llNNS+DMQwfrHt+kiTe6kz9SGI0ekJHiyQmVOnOeW9SGVRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=C1GKBKcM; arc=fail smtp.client-ip=40.107.237.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="C1GKBKcM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjCX05VwOXJmBvWNCHzUWVt1NpI4iB3hijRfaEVv0KoKriI+6U870ALNVpHDzXSfBKgMNQJkuiCGOGhYKGAM4Z4RTz+2NtRt6lvxO0vnIdGKvd2Zh7XgcFxTmUDzOPn7vEn37IZYFc4J5xw6c0u6IqsW/reeTqAVjcsTY7fH6smGtG62nG2fpDo0ffhlQNBYdKAN7khVrvaQZX6I//hlge9vEZF2pW5sVXkKkcNQVflCS5tyyGuENAVbvJ3Hd47WB3tETkB0BtwGzVfOlfvI4aby1+vKEw+fxaZMrf6ANPMFDnbPqnj9+bwJoXvbUfmpUV7zaI0ctZUG3v2GrFPVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kI7QL4McscNYNbiEtk9MH+eIEFYEvUdI+HqMZGVAiYo=;
 b=JgVWzroWz2qetgbfmhHcIErKr2OdkN9dTtHs+TJRm71rM70Sb/pLklA5px38nbqyVdHfAnsmXasSMvVMVoG+e8WRF49Ol4PDVhEXrJBzmtYPrFdfsa/ql/zE5EEOwflzd9f3NScHyiVTzPJeNtfURwn7PQ+AMWv0o+rpFTlb51h5JfuejUfsWqSM6V5qW+E7+0d8nwxQ/qLr6c0YTEETvv28ni/gR7DPVa3GY0f/iObxtg9XjXkHWyuYoowqEpHlIorsoVeD1GgwhRe6ZIhVnBKJrq//RX4EnBwQAEIAHPSTnakFv3Z9jOKBFPZmcEDNBiVp/jon4HwS9HVlahPysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI7QL4McscNYNbiEtk9MH+eIEFYEvUdI+HqMZGVAiYo=;
 b=C1GKBKcMAi1NrfTKLTOZC1DV2fxjY6Fr5a827anvRM8XnVf7GqCzZqkirTB8VmcnyspvGVLvIO9wVMX4aKMhLSVC7uVMpaVB2FTtPv9u+0LjcTX787Xpu38LXgUlO9tUc50QkcSOnVscMv2yi4QL8WvAyHM43J9U81YERQdvfGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8322.prod.exchangelabs.com (2603:10b6:a03:536::6) by
 SA6PR01MB8877.prod.exchangelabs.com (2603:10b6:806:42b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.31; Tue, 1 Jul 2025 02:46:36 +0000
Received: from SJ2PR01MB8322.prod.exchangelabs.com
 ([fe80::83fc:f69d:1950:9f42]) by SJ2PR01MB8322.prod.exchangelabs.com
 ([fe80::83fc:f69d:1950:9f42%4]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 02:46:36 +0000
From: Adam Li <adamli@os.amperecomputing.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	cl@linux.com,
	linux-kernel@vger.kernel.org,
	patches@amperecomputing.com,
	Adam Li <adamli@os.amperecomputing.com>
Subject: [PATCH 1/2] sched/fair: Only update stats for allowed CPUs when looking for dst group
Date: Tue,  1 Jul 2025 02:45:48 +0000
Message-Id: <20250701024549.40166-2-adamli@os.amperecomputing.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701024549.40166-1-adamli@os.amperecomputing.com>
References: <20250701024549.40166-1-adamli@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::34)
 To SJ2PR01MB8322.prod.exchangelabs.com (2603:10b6:a03:536::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8322:EE_|SA6PR01MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: 311e11c1-31c2-4807-776b-08ddb8497f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C4Fsx/t7S3l9fKVEl6rf4SmctHuZ9iXodpyxY72JpqSwiVPeT2SUttjwJBaN?=
 =?us-ascii?Q?TCvEihTYDicMR3JA/c5bS1TuWfhbvJoVZhddGKPZFOL2jLRE8/rg7w1ltVgg?=
 =?us-ascii?Q?uyjxphnS66kyTKzRnkre4YAZTSJPuotMRdIkRHfQJysdO4rlxs7+GyEy2OfM?=
 =?us-ascii?Q?08pHFULx6Nf5v1li8Ut/Wht39S8PBjqUqxEd/opnqJDHg1lfhXU5PQjPJhSG?=
 =?us-ascii?Q?mNrpJd7D+apsOJfIBv8dNjmtFAGbbVoa3U39pFS96L/CLShURwBpJqobNAd1?=
 =?us-ascii?Q?nCBP7riXxWfaqYiwnTmLBaKpopiKqrfQVVufb6z+WUHqeVDSKWO87JI8VkBT?=
 =?us-ascii?Q?ItHe3QESvEfZRjp7ORykCj0FEUMeobQgO90NtebAmrr3a6v3LTsDg7wIGy1t?=
 =?us-ascii?Q?7Xi8iATMtCKo8uZCzmfA1CIRUJg2lIF+qQajA6L1RGwlKRqdKlmBuecOaUUi?=
 =?us-ascii?Q?TKPYLngCHHpkXMtqK3fL11UXMEexMithojDyucCstFuzJsKppCX3wavYGGia?=
 =?us-ascii?Q?HURgaeRB4G2ESEs0/5P7yisvhP1fazaOPyo4l1lZA/KnFxf9smCjvYMV/mWB?=
 =?us-ascii?Q?wR5HzUWVN74tgn0Zq2eMsbZo3iEc1QocK9ZcsK4KP0y7npOyJxKGkd//k/l2?=
 =?us-ascii?Q?0e1LoQSy65xvBu98MipNxBIfkHChFKhAmh+aDUaLQ/JJIW7J8g5y0sVKEDxp?=
 =?us-ascii?Q?YBQVu9tvW7gVhd+od3MRnha8Zfg2keNFJzBOQRluriDkA23kh+FqtJ89cTua?=
 =?us-ascii?Q?kGuQewffii+AZptlZv7JaetJy/em+xJlbkj71aLI64HlGo0YaPC+0UeWvmVK?=
 =?us-ascii?Q?g07JVOGtRDOnIVnjcc/vAxUAXFhUTg8QL2adERENa1eTrRfLyfts0gVCShfE?=
 =?us-ascii?Q?Sc9jBfw+2KzUthrHv9Urj3vUb8GKpOwgXgqf9vv3nkSO7CrnZcUoieBZmsi6?=
 =?us-ascii?Q?JuxjwdISqcA2tWHctqZSCmv9bwCGFvGMmdxER5nPT9mbpoxjfKRPP5qRQcnU?=
 =?us-ascii?Q?defcA2AjN9ACmj/uMpF6mqREu+W9SCIttQHvIAb/nEzl6J7QWXHiVqN3fgxD?=
 =?us-ascii?Q?dzmeglyC2716dSR9c9E9FUPaXh0fWyLBBkYRFkFg74kVhRxlbmBN8N0QF68C?=
 =?us-ascii?Q?E0tyhefhDAUQ+Qek53+DkxfmD9bKhp61SPu+ZbIouHhx3o70rdCjZTDpItSU?=
 =?us-ascii?Q?xA/FAra7ghTYW4SiiPUPHaa+FXCfdSyU+P1jVakVeZ4X2bkqvkPubT7mNMEV?=
 =?us-ascii?Q?qttpA/p5KRbYU+PTUmFpTQaEEW1qU1Xk0qrMQFqb1Cuq67QhbvcQ8k5wZ/VM?=
 =?us-ascii?Q?rDm53eKvX4Ct5vClbEJQ/+eyfbRFv6M88xJqUmeBbM7h5gyfC37eafVBpNMC?=
 =?us-ascii?Q?TqJJiVridh9UuYHKtb38AI0b6zZGW8IfFiY1Dxt4bYKhhQfuUuEWAdQRSxco?=
 =?us-ascii?Q?A4AObW4w2gJYlMQ5EO5e910ISnEv/PHmA9AVzJIi6etJyhFiybmVoA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR01MB8322.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jnmI6tkHR9mi9InUKwBV6VnvuM3XfWLRyimQrhKjHOP+D63p7snUsDvah3sB?=
 =?us-ascii?Q?gMdb+4Jd5BIiT67ubVbV6lyHH1a7GMUd1qLiXuRzIzkfscSd08jm7zdMyBmI?=
 =?us-ascii?Q?XVE/1MX8o9QXBcXBkrcFTG/rvr+MsV3y0sdgZ9eZvpGnnOsSSgAyJzoWjoRp?=
 =?us-ascii?Q?whDzCvDbYgcBr11oMh1YmBMf8LW8g/LU2DybYJiADibiywaRJj/7Y3JH1Dj7?=
 =?us-ascii?Q?A5MJ79FHB5EgZnVmVUm6tJJrL06TwnNwmnGvBRPvcZ15DnCobZ3L4I9mqr3A?=
 =?us-ascii?Q?tMh0aNqhApTr9UbxqzyDuWBvbZyNPb4s+U30WKSLo0qSs6hiTbuXsJoBAlfL?=
 =?us-ascii?Q?5PMojJaizm2WLtOToKZ4XnCZ39EwyPrphA9fy2wNm2BuZ25J9wE5C/s0d3TN?=
 =?us-ascii?Q?K2flQeJ35Z/FhDMok75ITDpPpaK65u2JmElySjXBvK8QRMMyqdrUAXx1/XPX?=
 =?us-ascii?Q?vH8LgbhYTuxgqj5luAobEeGm21g3kR1/bVX6G0CWEbPWPM/DnM+Xa3MJuNxG?=
 =?us-ascii?Q?RNfviFuHPdNpJa9AxV3FEDs71Zhl47i3n1IKPuqSmm20djXay9kNy+5zRUk6?=
 =?us-ascii?Q?OXZ37xBWrql/25lkpiGnGrtDZp1yjnZZdhWZ/yv83iHd0qIYxLAVQX2LMzg/?=
 =?us-ascii?Q?oYu7bTUShGpWG8WxsPvVKlf0fnHQ1pygT3jL4Dw3gS0+jiQfhqglFfNRq6r2?=
 =?us-ascii?Q?dopA7E6+sIGyI9WpAATZPkspVeyJtppro0/H/iPHxOXeTd+5VQ+aGbI14eRC?=
 =?us-ascii?Q?DVXYpQn/VhOUUvpVgmwJ+QEPJw3gozqu9PvpC5MHryZxRgGVltu0x2evnk4z?=
 =?us-ascii?Q?Yo4rXxicvXPFcdTGCwG45U+jKxZEdcvGhVNmis+z8ks04trThkbyKomMCdTY?=
 =?us-ascii?Q?3edwPPsYXc2MdHXCYc7SFd2o6nvU/DJ8OkjkeJSqaBLEQQKgipxO/4KG4f8Y?=
 =?us-ascii?Q?7WG0/Vw0tv3XRHdyM9GeRzO5Tv6wDy0OQ3JT2rz96LGrZrU6d2p9tT2pnrp/?=
 =?us-ascii?Q?K9WgPdKxxFTFFfcjfP5x1fUiOv1qJt8Ya8KUatcXDrqgiR8uveRz3rvqbGs1?=
 =?us-ascii?Q?1QZ9JYUte4tBHZ05Dhty3ZUB9sdr3iLe1qvLKA4Kb15H29PhQgatQhv68o2h?=
 =?us-ascii?Q?dhUtutouwp+9LLUFzCzr61jwDN/C+n+/f4gaKEsjaMuOGdh5ILXz7/sitWvf?=
 =?us-ascii?Q?927P5m8lM4c3XiCtnVIuLMyNeWKheY3fxDO+AqZZ7bcGKi3HnS8AetAn4I0Y?=
 =?us-ascii?Q?zUK5wa2Rofz7rLFXe4PL5yVAK+cAxAm7Cl7OmeUqWau6vZUcx8KzrzVNY+Nt?=
 =?us-ascii?Q?uTo0wxNiNBBivE1eDXqJlMIMsCjhEaqto+nAqZDfg9UgH0+IzGPJYJo65jPz?=
 =?us-ascii?Q?CbkInAWH6GvqbDk78KbrGHSVe/TS0KQFR21hUJpxyrv707xWzDNn/OJeHvVF?=
 =?us-ascii?Q?O/Z7661F4JJZ/2rmAcrePsojQ4NfqoodxezS+MB98tLdgVKQtsEntoIVUNXk?=
 =?us-ascii?Q?GSlOByg5NoNFFw58YKpevVo0Ps9GemVB35hs7NkxVnIcCjlrc2hZU9E/DE2B?=
 =?us-ascii?Q?s47JZzFptIanz99rB7afuuM/P/W10skOnr/nU2vrFALBwCAoiVEhEK2kguEV?=
 =?us-ascii?Q?8FlsQyEh1oKvznUWZ3OvEiU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311e11c1-31c2-4807-776b-08ddb8497f42
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8322.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 02:46:36.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbrXsABbVN7HhRqzJLg6TU7k6hMbuGt1JHpag/j5uiFmIFVMSDP7tYf+XOB/+chO5gnzOO26almSgOp7EaD3xpiwgh09/5YX5ieoMUxcrqrDl5gA8K7Hpsrt96w8ulzi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR01MB8877

A task may not use all the CPUs in a schedule group due to CPU affinity.
Only update schedule group statistics for allowed CPUs.

Signed-off-by: Adam Li <adamli@os.amperecomputing.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb..78a3d9b78e07 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10693,7 +10693,7 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 	if (sd->flags & SD_ASYM_CPUCAPACITY)
 		sgs->group_misfit_task_load = 1;
 
-	for_each_cpu(i, sched_group_span(group)) {
+	for_each_cpu_and(i, sched_group_span(group), p->cpus_ptr) {
 		struct rq *rq = cpu_rq(i);
 		unsigned int local;
 
-- 
2.34.1

