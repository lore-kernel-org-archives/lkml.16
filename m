Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011024.outbound.protection.outlook.com [40.107.130.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF932F5099
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.24
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474147; cv=fail; b=cteYEHN7YcobqI4nTwMLvJIqC/XrlrbwTpoYFS1XfH6SHeqqFu62g8lCaa78/oJsbfL2HKGzncSSj3Dbt9dyJbKl0syMubDUXBa86QLKUCbd91dWS4Xy6toUYhbzHR7n94jzaES9+BFaEyd+Ndszsm+8EFQGJVIi+onv4zDNKrc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474147; c=relaxed/simple;
	bh=IVDVg8wNPyplYF+WocALPHrQyS3H8bG62Iuq4+mU4ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cevdRF+VnuML1Z9NfUcewlPbYlc7HdoS8uFRvzXmxg4yV2+4sP0W5I0m7fW+YCaSCUS1n1AlE3aylKu5mkIwJfa/MpEyO32N1NK9wFc1YApz9AlPKGM02/QJUtZ+BFf6gAI1KF32C54OWjtTEZOH7rm5VtkwfrXRy2O9rIETjFQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BPdmma2E; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BPdmma2E; arc=fail smtp.client-ip=40.107.130.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BPdmma2E";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BPdmma2E"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VoEtO1/yXR4csqj7JIE498B9uxBwnbJ4d/bIC0n38rIQ5++E6KG8aTcf1ifsM6KEGAlH6bJwZSPZJ0pQ3QNNRU96Hco/3jycO9IdJilXF5KGtik/rKLS2jOdC9KRMSm0EVKfCRYarudxzhYF46t+fH2a5iNrqG/TUSl6dZb2GQsbL9yQllPeaG7Er27xtmt8OIrT/sP5QDjPWUFnd+3qbW9BFeeSNj2FU67/vGI47Bh0dyQdfTqXUSFxoDv1Sf6HJZELUAJknf4v3bHMIRR5VAO6YrIFikxIgpzKwOxBdI+GsA5+X4151ODYvTvtgips7y0zUJi2JcCTgYOmr+LejQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIplKAenKdnMXELvbfnVbWaG2n8ZZ0uZndfYBQfMMD4=;
 b=DmuCMG7vdwaAucDgzB83XnIot03bBpCaC1ZlVx9HZ3oc0d+F/a7EWReViNxMqcOMT5IyemG+g4Um9mn2CeMhglCU7eK7eZQYm5DejFs6Eo4Tp6Ea/IDDd25SX/XmTbVzJu5uFxvUgEM2pbJtTfcKEucIsCZMEBo1xWY7/QTOHuGEr/x0AclnHG2ThU9kqjyFr570OdPGMQ9GeKGqqYs2NVO+JlNWDbq97B6eoJvT2w78FixhfE/A7hueW1bijEwXWDM4YPH9gMdYaqy2TlyhJ7revX2JQOCUMqThDo62pHpb4ZGSSvG3bYAvj8HbnuXEL7tVYQbDZkhYx4Ft1QIRAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIplKAenKdnMXELvbfnVbWaG2n8ZZ0uZndfYBQfMMD4=;
 b=BPdmma2EP/bcjhVl8e0aJc9Pyr6DFwOub9XPGJfaRcsNch5P7jBGDKcadQq3rz4jjqX5LdJ8lCEVAtDwmbrwUJxR4qk9VcsTw60s/MIoCfey0bA8eGVqpYUSWBRgkXPh2+nK3q/yvTq7vJKHYmxHV2QLz+opZ7Nd9Lzic6pLHn4=
Received: from DUZPR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::9) by DU0PR08MB8208.eurprd08.prod.outlook.com
 (2603:10a6:10:3b1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 2 Jul
 2025 16:35:40 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::5) by DUZPR01CA0016.outlook.office365.com
 (2603:10a6:10:46b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 16:35:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Wed, 2 Jul 2025 16:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hsm27GVHhal+AyD8PHd+YgE8zathEneXhBU4l+LKz7DYRbVFnbhfHyKHzsnlbTh+MjYvwhJHR3qs0Lqk7tG3tPMejFG4CQydBhqa5Qrr8hDJavH50hGUcENphld7mnJfeOgga6+jdEUv40fa3XvFJ3q7WSytDAAUz1uq+hlggOrUZVOuMU1HhTR6iDqwAx0hmTfmBcAk2f8L0UXXJVxA/rqui8XDuxY8eHPr74NTyiCRz2px0tiXjB2UUcanQdxFKT7o3PsHI/ger+guzezfsh0Idu2JEq5k5yizjD8D6AceH+V6lpnJ05kP4Ps2EP/7QqG6wQt467dcQNc3djNMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIplKAenKdnMXELvbfnVbWaG2n8ZZ0uZndfYBQfMMD4=;
 b=kQA/mgLu33IoonF7EBYgz7Q9qh3SxfFd/GyHeUaCW8WuygfSgKls5mFfQ7fkjESvaQnFTrTrtpAeKljw1Yu1VJyvEvKpcgXMiRZLf6IMF5uJQc9z2Z/nqy7IJrfbhvq/RjdW7B1ap+jWhbzp+XKdJ3UlZKTjLokC/xO4EQutHUpd9dVoN0akR0fMwkO1XJ7OKbbJxg/e39REC6avrqsR8R9NOtwl93tKMlRJ4WhVw+e86BeQPagtz6tnyXra/jOTDYLz8zkHA4Jyf/XAZFs4GFFR5Qx7P98PijM8aF9oRhI1eA30xUssu2pcUZRiJuu59iI13eLTcxDI4jbUznUwjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIplKAenKdnMXELvbfnVbWaG2n8ZZ0uZndfYBQfMMD4=;
 b=BPdmma2EP/bcjhVl8e0aJc9Pyr6DFwOub9XPGJfaRcsNch5P7jBGDKcadQq3rz4jjqX5LdJ8lCEVAtDwmbrwUJxR4qk9VcsTw60s/MIoCfey0bA8eGVqpYUSWBRgkXPh2+nK3q/yvTq7vJKHYmxHV2QLz+opZ7Nd9Lzic6pLHn4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by FRZPR08MB11048.eurprd08.prod.outlook.com
 (2603:10a6:d10:13a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 16:35:05 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 16:35:05 +0000
Date: Wed, 2 Jul 2025 17:35:02 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/28] coresight: Change device mode to atomic type
Message-ID: <aGVftn+0+DH7Yz7S@e129823.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-1-23ebb864fcc1@arm.com>
 <aGUAjcZ1elCoJ+KU@e129823.arm.com>
 <20250702103845.GV794930@e132581.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702103845.GV794930@e132581.arm.com>
X-ClientProxiedBy: LO4P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::17) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|FRZPR08MB11048:EE_|DB5PEPF00014B9B:EE_|DU0PR08MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a0b954-4642-418a-7f03-08ddb9867ae1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?3EqZAglRqPSXv+wycyHw6vjYskW4Rsnen2fIQbOUPITLeuYmrAIbvu+IsyVl?=
 =?us-ascii?Q?HQOMRXNBQ1D0at4leFegDUzL2JfbydL0lOZzcHj3ntGA+F/wHnrBu7SWtqpf?=
 =?us-ascii?Q?I1YGRIpV2uq+7WjRfHlWHW1Jm104fRicKJf/4sSw3npzQZ8/E+lxtd5HVjDo?=
 =?us-ascii?Q?jkCaF3/ojneClAnFs7cdTLh6sv72zQD1dkc+nLQviXZNjzabb4k9jfHYYLAI?=
 =?us-ascii?Q?Pbt98KBG8k1Y3MAYgezxPlJhfMVKU9Q4GtR7f+sGDdRzNZuD1+nlll+yhBRB?=
 =?us-ascii?Q?XH7xfBO3iOM5KirWiUuxwyfbBg/rSgDFYqFDwbKF3+222Q+z5Rp09sq6CMaw?=
 =?us-ascii?Q?4RSwCiSt+z0tnq+Vzdd31o9rBUfcSi1IJs0Hd0xWCkV6pO8tLGyTl5ZYYgxA?=
 =?us-ascii?Q?zYK94XY0I7wyYLc6YvKTzh3gJvn/7PGC7MoUrijs5XVATr7HAuJwUH253Urk?=
 =?us-ascii?Q?Y7bwXj9aPHoOzNz+Ad5MQ0zuZBx3d6AcxhjPtU1S3W2z30hizFQjw2GmdAdG?=
 =?us-ascii?Q?I5jHB3cVr3VBM5shVHTwTdOHeCFwZ/XgSZ1PNMt3C+ERmj7HmAF4PY9o6mcM?=
 =?us-ascii?Q?XqU54rNgohYEOtBW0GQN4BNhthwHQjeTQ1XvK8qZZsTpphWX4H8PjS/xP4Vc?=
 =?us-ascii?Q?xZQR49OyqR3pnTySQzttjkbOETzlEJa5TqKoiACyqFdaq6801uxxPB+EfRYQ?=
 =?us-ascii?Q?7kKxiCPy1HJLVP47SMgnFZ6N4r34HR7Kp1uOsgZ8Za9JSngewc0yrdKEchwF?=
 =?us-ascii?Q?g+A4BRcp2YLrhZhsnlrIqEdpSbxrZOWKvoPuS4DC6SvSmBoxxi9cd54mW2ea?=
 =?us-ascii?Q?h53vVEoGTGwNWaNJE9NmVulGC5zYrst3LynPqloSSJYQx1GMfqVMIx62BwzE?=
 =?us-ascii?Q?A0pwBHNQOtItfSL08s39KDUjkjvBcPYNZ7HZy5A6fQvWyfCoFaKm+V7vvvV5?=
 =?us-ascii?Q?dus8q7zEKwetXEXUkKA+RN1x9VjpLHBs/RpejNs9FYL2z9MWNAyoE95/7Ybi?=
 =?us-ascii?Q?6JBOIDoNwx7CYRiQm6He404h1WV+hQRhMuzLr4vsFr6D+0r5oehfAPEkCYyZ?=
 =?us-ascii?Q?mmPmXs57KNunBrEcJBhS/mJeVofPYp3YQORw1oc2SqJgvAbX83+UtIrifxT+?=
 =?us-ascii?Q?+yacsSINo16pwVnWt7aN5mHlCqYwt/mc/nSWE5/a/bMu4Uw8bv6qHEdPolxz?=
 =?us-ascii?Q?BCkD3R2y5G9xR2L4dwqGvJUnb4lZ7gEApbB93lnmUauxpH6qjAJ/2lbNkk+r?=
 =?us-ascii?Q?VJgvhmWbdkKoNBo5Y4dyvmArJ0NOxpH3J4b0k6SImd0ZUaBYlPVfAahJ1OqK?=
 =?us-ascii?Q?FRflTqoaFfRHHnU4gwuU5H5PTYA2rNnAHmFQ3BKbjt1N4SzqkHvD8T1nJyYt?=
 =?us-ascii?Q?Tnp3bMSKfazynu+mCPdGHO0cgf2x1aV7xrpaTds9cMCM051SluvBJpgzwcft?=
 =?us-ascii?Q?IBwwYB656Ss=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11048
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb99461b-0ee3-4964-9812-08ddb986666e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|1800799024|376014|14060799003|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V0Eb69ed4MjVnxDI/KOvwqFtZuFVQIs/gSUSkA/lozRyFT+cXqISERI7RKSq?=
 =?us-ascii?Q?bDAKygM5pKRhUPm6Ovu6VrCnEWiVuIqQDJ8k+ISmovv1fkaD/cSO3AZRixAw?=
 =?us-ascii?Q?rFaatxo+hkeqVIKu1utYVxWVILFzEw4zxn/MRYr+Q+iMCrTR3LHrcO9BBtyU?=
 =?us-ascii?Q?iuoeMm81j84DukhOqVAaIaBXd55hDeS9q5idyx9ju66ATTEF56bvB2TsaTOE?=
 =?us-ascii?Q?3ypDdfR9WO6kxdcCVWE57MKYPKJbnpwS5JbFyCcwfrZgIC2LPnC1vhA9VFic?=
 =?us-ascii?Q?fakzcbei0ZomPntWjuR/4lWnCEKuvxsLqL0+J4hQu8YPdYMQB8T0YnBm/Pya?=
 =?us-ascii?Q?X44++C8e7d881H31f8s8YzLbODoHQYDZhs5TErqpf3Mb5j8ilzh4hqGKmK8x?=
 =?us-ascii?Q?rhEbrZG1TD0zzQmN3gCkK4vPuYcd6Q+twu+/MDH7B+hict/Sf0FnibsQ/NjW?=
 =?us-ascii?Q?NdtlYBiasm79i869E2wSu2C6Ynyfw6y9mndnfea1MLW1le6qvlCPu0eNBjVW?=
 =?us-ascii?Q?lvU2/g2VlWfMwc2/JXsNQ6b2mAESi6RRstBhyQCOxOvv/wIFhg3/aOgiL3GW?=
 =?us-ascii?Q?vXTeMTVGOAXrk+NuM1QakQFC9GDosDx6DIe1qVtQh8x3ZpP6RDpnS1XEEhuB?=
 =?us-ascii?Q?bMDIlV7L3L7boFH3wew3Bt2ZMsIkaSt5vzNwR5YeKuIB+3r40dADkpiC7fAC?=
 =?us-ascii?Q?OhQ2/nIKP+dsDqnTYiDtj0Ay6NtF+XJOVWrRGaEnp+RGspcAwIH73tajoccl?=
 =?us-ascii?Q?MES8Em/68IYnmLc7b2wEKnia4XipfeJP/L55r2eOqEzv+GXnZ6GsKpv2Hhwz?=
 =?us-ascii?Q?s+BV5u7tqp4opGn6p+iRfkz0eiWORHb/+DO1jLyTDw5XObNUss+duqy6O8ox?=
 =?us-ascii?Q?kCXI84kmNxRC6k+p/FFNXlyRyL+Jhg6M/b7M+l48T8JmN0plSac39w62X7Ju?=
 =?us-ascii?Q?uyIOcYWt3//4jTHfv3LQNqCMOUZC65jxu+rCUbvqKia7mWRJvkwF7AGd1xme?=
 =?us-ascii?Q?nM6zr5QWEoO2XLTUN1ZKarNodJA+nxZjGFgMFkOUt4joW9H7knr34G5NQYtM?=
 =?us-ascii?Q?+LHm6FDxphEIsOG0jHkVtV8aq1hH5+7M4wnG/OeMJRvPfoUpovqJe5/e36kH?=
 =?us-ascii?Q?jvg9CJ5YMLNJqRJdTnRfzANzIuG7VOtGDm9oRzlFjWBaIsoK4w7ELV8GhkTe?=
 =?us-ascii?Q?3vy2dMhWcPbnCYgr4u8HqRvB8GWpMoUhdWo6ocLTjcpEJBTGogV29g/o6ig3?=
 =?us-ascii?Q?L/44fSb6ogEGoJRTq6sCh2ABwf4TMnbw0Bg0whMH2t0n16CYO38XR6FynzZk?=
 =?us-ascii?Q?ye5b8p4f7Opzp4GRx1BOz3JLn9g0wCzdhX1LdfgOXvXh3T5einLx1Rf42MBV?=
 =?us-ascii?Q?kMk0LCNuJHNTnfL8Vf4yuPTVs7ZQLa44MfO0xG88sqBHLKKPR3THUfAx9exj?=
 =?us-ascii?Q?/akkFjqNKCY0gQngZkhg5ZTkI6eDQloxi+S2G2SaUtkUiUPKkMVGNBW5thDP?=
 =?us-ascii?Q?3KjN6LYFMmQzKCwGoEDX3aiFHO94+wkGqSxC?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(1800799024)(376014)(14060799003)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 16:35:39.3843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a0b954-4642-418a-7f03-08ddb9867ae1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8208

Hi,
>
> On Wed, Jul 02, 2025 at 10:49:01AM +0100, Yeoreum Yun wrote:
> > Hi Leo,
> >
> > >  {
> > > -	return local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, new_mode) ==
> > > -	       CS_MODE_DISABLED;
> > > +	int curr = CS_MODE_DISABLED;
> > > +
> > > +	return atomic_try_cmpxchg_acquire(&csdev->mode, &curr, new_mode);
> > >  }
> >
> > Just question. why is acquire symentic enough in here?
>
> My understanding is that acquire semantics ensure ordering between
> cmpxchg_acquire() and all memory accesses that follow it. However, it
> does not guarantee that memory accesses appearing before the acquire
> are ordered as well.
>
> This is exactly what we want in the driver. We must ensure to first grab
> an active device mode, then it is safe to proceed later operations (e.g.
> set configurations in driver data and access registers).
>
> > before this change, local_cmpxchg seems to use full_fenced.
>
> Not really. Arm64 has atomic instruction for cmpxchg, it does not use
> full_fenced. It should run into the path of arch_cmpxchg().

No, It local_cmpxchg backend with atomic_cmpxchg() and it seems include
full fenced.

But, you've explained the what i concerned with below diagram clear

CPU0                                          CPU1
// store csmode in store buffer
atomic_cmpxchg_acquired(csmode)
                                             // couldn't see the contents in store buffer
                                             atomic_read_acquire(csmode);

                                             Send SMP call
              ,-------------------------------/
             v
atomic_cmpxchg_acquired(csmode)  ==> Fail to grab another mode

However, I think it would be good to change the atomic_try_cmpxchg()
instead of atomic_cmpxchg_acquired() to prevent redundnat IPI trigger for
observation failure.

Thanks.

--
Sincerely,
Yeoreum Yun
