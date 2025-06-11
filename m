Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB2D289E10;
	Wed, 11 Jun 2025 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647826; cv=fail; b=MRDSarxgRgGN2RYQaF1fnzR81YEYc+/qGbhSQ8+kUeVu8IX5d9SCvjnGn/gcQRkXdyVMRpAKlYqEOLSA/YuPBzhHBgU7HfEs+CwCJs4wSESZmQ6YianpH3vm1Z2rUx7xaf0v5LA7eqS2cfX+Si1oX1O9wYOx441qx2C3rDvSutw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647826; c=relaxed/simple;
	bh=tXXsXCcXuKcI1KI+49sUG/xawcFsx3e8aqboF5abga4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cnOOKiIUPz7aKjuvZipiNequ9nO6qtEqRyIN2BCgaXp2/JrTO0HNWptxtAb7gisvco5JP3gNFA0GUn71mZqIlirv9pLhzAaylBaEI7XhMgfhdGGgNuwbRU4M4BUqyKjUYRoiGKtNnv+Oh5+jGwgdlXhIEnX4B1oY2TtmGYxV7tk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ei3S+xlA; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ei3S+xlA; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ei3S+xlA";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ei3S+xlA"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NaZv4V0IdMJpwEIp61GGGglMMF9GTMEi/Ts4C2hYAMoUAWiFuyg19KgKW56iae7jntZBy0p0nhDYYoD60Lm+y7SpcovijGmfiQdzDc9wPrryBB92EsAqapgXQdVngQU/LDW43uTmD/ye0Ehrk8oFy3cwONUioOY35MvjW4aucjU0QVhrg7n2XSbtwJxXWYMy+UQAjSaTuRbPl2ixXMW8dPgTqC54qvksAjIm081SF0EmvIkwYuSGNBTvCeR5jLQ0zCSsamFRjpJZCxJFBSQLp60WKv8nHRAd4/CfwWmvXGFyOkn6cymeEng5g/AgpOLibJbj1tmdMvChTTB/jtetKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXXsXCcXuKcI1KI+49sUG/xawcFsx3e8aqboF5abga4=;
 b=K6DfoYHVKGdzhUSNKf8W/KA/Srsv2fmNVrjQl2SBRKYoJgXJubQkURuow2je/2gzNJYsU1AfSruGONN4ZorNhWv/sotHlveKKJcR5YAQt1wTWfcqJxZ94b+6RucNypABbHvc+ocQ2qU/1Ex04KJTKxGlPtovjEKQt2+BT+CZFRfF+tUxQYLfvMJAg8dc55LJDI3rZ4y/BiM7bXWes1xjhUUFVRFa19fEd6gWjWvIF+Z8ZIPEDD4hZT09aUcegQACBx+o3GhjZiOPIPLnGQbYpAjNuTfKTwn8SVXadrSZgjAdArRM7va03dMR7Pa1puZnWuSmlR+7uipmvMNYI7t22A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXXsXCcXuKcI1KI+49sUG/xawcFsx3e8aqboF5abga4=;
 b=ei3S+xlAvXPi9OorWuqE3LxAte/5PwNIG3djfL8e/4vET+3JPnNSbMiucd2lXMaS2IQHHBBAFR1E762MPe+y72i+W5oNe9DFAv99lP/L90JUAtdkqI991kNflbjdLKWM9pap9nGrnr5rh1G7k8S0WwcNTsWPCC9vsLv8Ayl7eDk=
Received: from AM0PR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::14) by PAXPR08MB6398.eurprd08.prod.outlook.com
 (2603:10a6:102:12d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 13:17:01 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:208:10e:cafe::18) by AM0PR01CA0073.outlook.office365.com
 (2603:10a6:208:10e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 13:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 13:16:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbPoPefsn9EwccFhkwiAUDdbpjX8Z7OYCwe0+UWyzlpziqi77EPdRvQfVIGVcCOmzjrxOsF2GEY0/j2QiTB91dLePNbNzfLdijYK9OKxqZpptPsadZv55iAiu9xTMozr85X78Ok7v9FXgfeljTwvopfz3U7RCLBF0e8fWMs16LEZ4PwM7M3br0GP1nUWe/mMhUzRhm1DtFmHhhGYv/k8MFHkZHWaGQZuLmkNs9u5MVhR6GaPLls6oyi52F/9kbivQRqg0O4h5vMfR0za4T0sXAt9k1fG5PZMEXVt50rUefhBdJXaYrTvaDRN0IzibsPaVDjGob2ymV7aeCo9eCZy5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXXsXCcXuKcI1KI+49sUG/xawcFsx3e8aqboF5abga4=;
 b=XxOQjbipmxkpj1Ce3184OmLCzTTLAO+gRDKHZqF8f2bHHoXirE3J8wLWpTxIcCkhbzyqoHlL8yYXh+jFGHvB4rW/ScB3TaB/01wbzXoEJRfTTDdGkOX4JAC7Z55OhMc/GQRZioNS7C8nI5x9WOjB4JqY+jdiU+KamJV0D8YlgzGoBuIta9qJ9MHuP0jf/dZ/e3bD1ONYRCva0wfW2AtHrthmP4EfEGx9h/kUXfRWyU85qtEb2iKEnnUM2r2wj6F9a7mgaiizvVjQSwfERrPrVw6Ru6Qjcexf79V84i66dSXj3ZsL9wX1YdqTKJYFRXHjxYUYq3/PrFsIeDfZpHhxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXXsXCcXuKcI1KI+49sUG/xawcFsx3e8aqboF5abga4=;
 b=ei3S+xlAvXPi9OorWuqE3LxAte/5PwNIG3djfL8e/4vET+3JPnNSbMiucd2lXMaS2IQHHBBAFR1E762MPe+y72i+W5oNe9DFAv99lP/L90JUAtdkqI991kNflbjdLKWM9pap9nGrnr5rh1G7k8S0WwcNTsWPCC9vsLv8Ayl7eDk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DBAPR08MB5605.eurprd08.prod.outlook.com
 (2603:10a6:10:1af::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 13:16:25 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 13:16:25 +0000
Date: Wed, 11 Jun 2025 14:16:22 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>,
	"pcc@google.com" <pcc@google.com>,
	"will@kernel.org" <will@kernel.org>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Yury Khrustalev <Yury.Khrustalev@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"frederic@kernel.org" <frederic@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"surenb@google.com" <surenb@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v6 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Message-ID: <aEmBprs3ivyhJdek@e129823.arm.com>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-3-yeoreum.yun@arm.com>
 <c0b4dc8a-b37c-4e8e-be2e-bc8906615702@sirena.org.uk>
 <GV1PR08MB105213A44E40741700202F7CFFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
 <a11fc436-9952-4391-a3ec-ad359fabe8bc@sirena.org.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a11fc436-9952-4391-a3ec-ad359fabe8bc@sirena.org.uk>
X-ClientProxiedBy: LO6P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::12) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DBAPR08MB5605:EE_|AMS0EPF00000193:EE_|PAXPR08MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: 56edcc7f-1832-42bc-1674-08dda8ea3ee5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?MKQCXNAqVNcQR6jQiYrMPVd2jiuQsLtwwe8otXdmObCRlojri/t0GgvrzL?=
 =?iso-8859-1?Q?8hkbi4OV8vQ0gLQyWzBgDqM/7SbKaoHIDHfDvNCFSCuZ7EHa4jkU6q97Ys?=
 =?iso-8859-1?Q?DO8EF5JD7JHUmrgjFe2ij5dL8tL6oK5imWoYAItLA+Y0D11fiB4VS4we/i?=
 =?iso-8859-1?Q?bk+/QoVJ0rayxHq79xXLycVpqZWFoUxDY3I4av5VdejaTaRRPAUxtNgnhi?=
 =?iso-8859-1?Q?l45kv0YN//4ehS5eaBYe67YmplCNx9GeMLNXzC5BxxxAJhvsuyC1O4tZEv?=
 =?iso-8859-1?Q?YgXr/FIb2atQRK2kIUptjCzFoCpIBlbbud9C2kPuS3TvUq2gBHYP6Ojokt?=
 =?iso-8859-1?Q?4pDAYp7IOqvHuB9q8V7v0odGEnJyC/4z/rQOItZ9h2hqOHlL22GoNQYR8J?=
 =?iso-8859-1?Q?C21J96+fey+3g4phqNJZiAfCoOcnqm9/UUjzkLf/GQ2TngDwiIxblQh6aP?=
 =?iso-8859-1?Q?5BPxlsLQDKBOlnKT58Zai8aw9iarlb2VVqe5WWBi4/Uusq4kEoeLy4zPK6?=
 =?iso-8859-1?Q?GZ6H+qhe7OagG0HfsQYnvhj8V0fvJjdOZ4MtU4uTril7BR1GDdgE+KlOOc?=
 =?iso-8859-1?Q?bkQNuRtpohkPd3x7F7hg6S8UDwnxa7G/Whnj+6CYmF+o8IfWLY/Esw/qve?=
 =?iso-8859-1?Q?5iSPBvQ6/yysIjbjKdAKJxzXr2WKJ8ZjoPTLFqAW0WdHrSljNrdwUnPkA8?=
 =?iso-8859-1?Q?gyhro+WKlhP1ZhrotJvNMlz318ei8YHzayOrFa3ZahB1GMIE3VMvo1eLjo?=
 =?iso-8859-1?Q?xWNxkimJ6RnDlyKGeIsErkB4sEdEABUm9vn3MwDngQSp+Z+2MTrD8ui4+m?=
 =?iso-8859-1?Q?UBoiu+jeOpP0slxRr5LLlbKE6K9HTpdrQtK3eKOY+aOfugsVwLJf6hTcRx?=
 =?iso-8859-1?Q?WZtmZolVud61uG74C8Qi2QTRIlWoQfeqruvzobeaEyHpgI2aw/UZU/YGih?=
 =?iso-8859-1?Q?LK14gbUvQl0nFT247VO00NiuqgRpUn7g8npK2SSggbd0QlSakxhR0zmwuJ?=
 =?iso-8859-1?Q?85hedi2vCvLGhN6Jnv0cYnEw/DDBFj+Wjcnqfffs060vyfAM1ui24HIVTw?=
 =?iso-8859-1?Q?Wz1cbSLPQYwcfje/PyLZFC8AR2VpxTB/pNL4v+WBz7bIFdkTZuOjL6U5vu?=
 =?iso-8859-1?Q?58+c+z2fMkG0LqdBikZd0JkjxfFornTDnFFzuRb7Ymy6EqBc26UFTLEDN3?=
 =?iso-8859-1?Q?+kOHu+9cfd0mMqOZMyEH+escxrPhtgZmX5C66bax5P18f4VGWQ14FHMQeW?=
 =?iso-8859-1?Q?AGmKDcHRmc+GdBVjWvy2eFO4U0tNKj2vvgvxuEo+/r53QBKeopmW/+tRHf?=
 =?iso-8859-1?Q?mk7o/tnctbVpl65mEBhOcI8KAN/+oTawzc4mdkimVwSp37OHu1mzLD2UZ0?=
 =?iso-8859-1?Q?YRy6FP+6AfFq6pZDR7fAXfYvdeKJNv7W9oqWsGfWwo5oZhbZL6D5BUnjr1?=
 =?iso-8859-1?Q?P9JqLxpBZ4CGGSmZbSwBR72K+7jYWlPvIAMI+A=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5605
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd8a0b7c-e01b-4b23-6c02-08dda8ea2ae0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|35042699022|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?jETOWFmQFacP/r5NcxKRtg9Zk+oON1LFLyQIskHWpML6B1Gvrd2c0DZNRM?=
 =?iso-8859-1?Q?thxq/AeDpCaEuHPubZLfT83xLh4lLTeaym3rOxnLwAKZ13iNVkLf/KUKbR?=
 =?iso-8859-1?Q?asQHK4GuXBVAURigbGFgGKRVh74XZIUvULaINwo7Cm7SsojK/ECxEKhaic?=
 =?iso-8859-1?Q?SaV/u6lM9y3ML6QetticWSLZduiPSju1xlpu5OOCQvTYVVPODMBMqk4iuf?=
 =?iso-8859-1?Q?CWa/cO6xV+1bIWQrPLBD29p8ogzZXGauWkBcrxKxX6KjW7OG1O6s5Kmk1h?=
 =?iso-8859-1?Q?s0RekYI0VCwACJCmmECVauWanRhyuirSFviGGe0vxChTALkxAF7vxOTeuI?=
 =?iso-8859-1?Q?USeTsaRlzZkO1B5DH57h8WnXBsBo+5lE32QoSm8bKtpPtY8GV1DlDX/RK5?=
 =?iso-8859-1?Q?wxnMd4DOU9QtBSDx2iGdHWKhZA8G5wT9SU8xKR4GjVygCXywrIUJGOKYUz?=
 =?iso-8859-1?Q?v6oUDXbzh3jxDuhSEyErgPTvyTiPs4cwtQkcj9GuhZxamPz5UyKiIXT/11?=
 =?iso-8859-1?Q?lo5VuUQt7im4HygWkVetDi+++hWJSyPOarnovWJ2C0K6CUBN8Y54t8VyMm?=
 =?iso-8859-1?Q?U4fJT9nG/zNJC/oyXbtlNFKno3cG9H08CdVZg11dDYxN/SzR1qr/GjiUda?=
 =?iso-8859-1?Q?hPY6TtucybSnGYnU0ptVJvC1/zYsyPlFbrFyJS9era1tIx3vOjIPPAsJjM?=
 =?iso-8859-1?Q?QaZdq0M0e8H+CgMPDy1VeCAsi6QHo6NeIKUnetUnMZyUX3mjvgfxXYMCGL?=
 =?iso-8859-1?Q?1THde1F5ga7ZudV1ym4u5lWkxPdGEhXcqVuRPZtXWdx1SR469VLQaKnguS?=
 =?iso-8859-1?Q?N6gi+6DS3rfw+d7IFxttxZ1UctvsqU0v4KEbJ6y6ZkyMV4OI+hVTA9eaDM?=
 =?iso-8859-1?Q?3RWKJqBb9i5CmThiVK2vN4aAhBhbO3zMZMHYSgkWgszaTPtqbBeuS8QkMH?=
 =?iso-8859-1?Q?ex89nRQhPxxtcpfzKOxpU8myZ3Q6EzwgQpzSa0aEb3VlzNYDeZB6KXg0w+?=
 =?iso-8859-1?Q?b0GCxUnMnkFWwFjea0rHxRT+v4zrU2b1XCNqkDo4nz0R5qLoHW7HD0sSbt?=
 =?iso-8859-1?Q?05grWSQcavbW4h8gCRgzmkHNmcQsxc5mpGpU7dkT4SiOzaFHQ4tMlqvCyd?=
 =?iso-8859-1?Q?LcsfLyjvM4Wghw7FSv5hrL0jAG7oA7ZLqdMtbdu9MSrCJK+3xLgLkXjppG?=
 =?iso-8859-1?Q?4Br07O1YOCdFoqgbQ9aBtlHl1lwbSsNNoT8FUy87lY6qXDRV+sYZx1Xthj?=
 =?iso-8859-1?Q?U57uyYCmLWFN80y3db1Q65nnWXCxCoTxg3IFqJeffxnyNLvm6pMYFm1L4c?=
 =?iso-8859-1?Q?RM5uM582d345toQCUuSoKafrvE6POUwYQ9GqUrRoqstN+Y/LDMxHStRKpe?=
 =?iso-8859-1?Q?fqiz3bKpAuWX/Jn78vKAYF6dIJ32bQP0jtXWPYgyMzlGd6q5jDJXtRuHnf?=
 =?iso-8859-1?Q?++H1HD/3QONgQrD4K607apxxo0B4B35z0jGMj0QyBJ8WbsGwJM3f6imavu?=
 =?iso-8859-1?Q?bY1KvPhUquUJbpsD8PkvkzRAjWrRPV7pn1b3j0KIEdVRo1XgDeFA1Qjc2t?=
 =?iso-8859-1?Q?PZkMM+HimGH1+5AGaVBKo7raaQqb?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(35042699022)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:16:58.6595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56edcc7f-1832-42bc-1674-08dda8ea3ee5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6398

Hi Mark,

> >
> > > > +HWCAP3_MTE_FAR
> > >
> > > > +��� Functionality implied by ID_AA64PFR2_EL1.MTEFAR == 0b0001.
> > > > +Applications should interpret the values of these bits based on
> > > > +the support for the 'mte_far' hwcap. If the support is not present,
> > > > +the values of these bits should be considered as undefined otherwise valid.
> > >
> > > The constant is HWCAP3_MTE_FAR and the cpuinfo is mtefar:
> > >
> > > +���� [KERNEL_HWCAP_MTE_FAR]��������� = "mtefar",
> > >
> > > The reference to the hwcap should probably be one of these, I'd go for
> > > HWCAP3_MTE_FAR since it says hwcap.
>
> > Just for confirmation. so change to "mtefar" -> "mte_far"
> > Am I missing?
>
> I'd write it as HWCAP3_MTE_FAR since that's the thing you're
> referencing.

Ah I see for documents. Thanks!


--
Sincerely,
Yeoreum Yun
