Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CB01F4C90
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.41
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748964233; cv=fail; b=J+4zOHdrHiKzHhdHvfTJ8I38z79tI+vZnqVTXpvWqC+N63nzUb2x438lOmWw0rvX3FjEFXfe4ll+Qv9T760Kz2ZOYbnOjALOEswD/WVLNnPwhScqlzrTVPvNbUjESdtXBK6I0mYYXAjCJDl1xilIz6qBZ06XB4K4jH8qav0cbaI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748964233; c=relaxed/simple;
	bh=hYVY/neKOQ2v052384YvecQlpoicMiuejJk82QVf1/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R/8/RsliMZchou6ThgjixLYTPE2HSyZdB2w1UFWU7fnTL8Fu7GUrJ5TafquHe4iAnt3/OwRFV2AJuO2v/A7i3dm3D9FZpBQ3SFqzyUpL/1D5QnYxYlXLqEdWSfcrE6U9zz66ShkvthuU8fydxXHaQGRpHlG5FlMlLa7wQcirWws=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dVIwsKAx; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dVIwsKAx; arc=fail smtp.client-ip=52.101.70.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dVIwsKAx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dVIwsKAx"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NPn815D3BUwfoY6/zxKOgjeoHJyJbl66cUUWWbXi/UXq7xHa7rcTuPGueW1+WLgEKufdd1Md/ew1rQ1992qilGpv7yVNSN0FY1tfTTEp1//favep1r7D7tV/83lLwpwxEwxWFfCLw6peat3217raqoHTqCbKORqjy0XKJrl3yu/YOmCTd7x63lg5ws/sBNoWycBGhl+G0mv/OJnmZ7j/CBb37wksNXPZiseB10CaXvONaPhjPPU9Hv2nUYCg7UMfHmgDt7+eciC2Dm5fq/+YHMRfRCZ9sSlRjqz/2bP+9dYFzb5qRdtM6CVoCWLmyyScdXw6Yrqoj1KHKFlw6sBlXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GcGlDGtlvFc5o5H2A70sU/uFjoSRR8995tI68DUXac=;
 b=drDZLxbtBF45A7XxS0lsT4tzgcSwFqShNZjz1xDQBPiXOmbLfnZcufdFISVFPGoGXdJ4itcekwqX3nnTUrHJogv1B0Staq5BaQ3Aw+lvaormxCibQat4/mWlVYqkYYTSd+d4jN15+zsYqn24EQfwRQ+wuCgYvhMOX8y7/JgC4RSYnPWPFhS+a+fc55YG/ykhkXjw+h5QfL5Xd1sAa8UdDBVLIuZ7mBI3OjiG5Qr5cmFacW9Mw4m2eH+m7QQZvSdFjfbBkgdHo0DvSUqhXRKLiXWFgQK5qmomaZks2q8o+bhmnBJS96qx6X+NZx3Y+8dVBUUIB3FEBdF5Au2V1jFj+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GcGlDGtlvFc5o5H2A70sU/uFjoSRR8995tI68DUXac=;
 b=dVIwsKAxN7exPdtV4e5WL/UEHQeBqdOJMHjJo7pwPP3KZY2hSyRN4yiOj8Pe4uoiY33+qzvgLFHOaIfsd5ROC+//V9lvsMhzTK2tNIFNg3QSWkQuZwJhGkQtgmzvgIrth9kVFq0NtrLKyx6YYf81nspD5+SVAbpFhTheXrelFOQ=
Received: from DU2PR04CA0285.eurprd04.prod.outlook.com (2603:10a6:10:28c::20)
 by VE1PR08MB5741.eurprd08.prod.outlook.com (2603:10a6:800:1b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 3 Jun
 2025 15:23:46 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::37) by DU2PR04CA0285.outlook.office365.com
 (2603:10a6:10:28c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Tue,
 3 Jun 2025 15:23:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Tue, 3 Jun 2025 15:23:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMcvF9BVwQXfEhmBYfqqWCD2v/oW2kqJ6Eymj5i+Ld81emPLzVzAFAbKxn885z3htzBnvIxQVae/7AjGMCMlJw9bc7Vjq0E2we1NtYC5oVxJBFbtSEWkQYDMJKhGxeSZzUjBQuvPmgkERhtoYkHAnFzMtZZAAUCKZ04VPli8b/XNN32ZICQ6cOv+DGwsgAvJ9mXw8B0bx/T/fkmbcFwkK6S6gAnWoNSHcutzWE0CQ7fArZUYAMpGoxsR1C10RPkvMN/wvTJEsGrWBFZPaEL9aw5Jwq0jMWS0TwkgmeDFqb6W575TFSBCAOhnQfZEm3MXJCPFqZqZNw47xuzbfMf6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GcGlDGtlvFc5o5H2A70sU/uFjoSRR8995tI68DUXac=;
 b=pnwxHFYfB2NX6MGyCboR2b1GOLQc97gwl3tbHLlH8tIVa3kZl15nD1kDMM1OiLz10ZPTt3+tidAmeRUui1MDU3tZjjm/ZsWDSpuLAqN/eX8ceHHc873IbxrltwytsjwbSuqHk6drQeiE/av1ayLjoN4KFCuJ/fN0yEEbRA0yta/Oi8SD6RD0aEAa1hBJ8cObb2ebHIknvRNU1c61240P9cKpTBWJoxBlSAnJmtD6AOeEKxdJMazjKK9JTeaRr7LN+iuNJdYCdbTZlUQXlKqQqStkHiLa4H6ofHvVbmdw1lokTaecqPdtptEAJfvSWbjp2tw/6AAcfczm74wMaeW+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GcGlDGtlvFc5o5H2A70sU/uFjoSRR8995tI68DUXac=;
 b=dVIwsKAxN7exPdtV4e5WL/UEHQeBqdOJMHjJo7pwPP3KZY2hSyRN4yiOj8Pe4uoiY33+qzvgLFHOaIfsd5ROC+//V9lvsMhzTK2tNIFNg3QSWkQuZwJhGkQtgmzvgIrth9kVFq0NtrLKyx6YYf81nspD5+SVAbpFhTheXrelFOQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PR3PR08MB5580.eurprd08.prod.outlook.com
 (2603:10a6:102:8c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 3 Jun
 2025 15:23:11 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 15:23:11 +0000
Date: Tue, 3 Jun 2025 16:23:07 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
	geert@linux-m68k.org, broonie@kernel.org, mcgrof@kernel.org,
	joey.gouly@arm.com, kristina.martsenko@arm.com, rppt@kernel.org,
	pcc@google.com, bigeasy@linutronix.de, ptosi@google.com,
	james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ada.coupriediaz@arm.com
Subject: Re: [PATCH] arm64/trap: fix broken ct->nmi_nesting when die() is
 called in a kthread
Message-ID: <aD8TW7j3TwUsPLqJ@e129823.arm.com>
References: <20250530092723.3307630-1-yeoreum.yun@arm.com>
 <20250602124738.GD1227@willie-the-truck>
 <aD27GxSWsFekORcy@e129823.arm.com>
 <aD2_Jp7CQgnp15Kx@J2N7QTR9R3>
 <aD3kfTx8sF8/Yar/@e129823.arm.com>
 <aD7EA2Bmp-mrWZaN@J2N7QTR9R3.cambridge.arm.com>
 <aD7ZCnNUqxb9XWNh@e129823.arm.com>
 <aD78oNHA5SlaH50z@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD78oNHA5SlaH50z@J2N7QTR9R3.cambridge.arm.com>
X-ClientProxiedBy: LO2P265CA0118.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::34) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|PR3PR08MB5580:EE_|DU2PEPF00028D0F:EE_|VE1PR08MB5741:EE_
X-MS-Office365-Filtering-Correlation-Id: a923ba6f-d53d-45fd-5ac3-08dda2b2a11a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?yqpEzbfSNUDIYa/A3xSMzvz4XrQUSBw5OY3AL6r9eSmHLVrCz08R4CCGmS7x?=
 =?us-ascii?Q?nmhGv+TFFPhlzSxVF/R532vl0d87+zcaTDHTDN9K+FVh6f98plMG0VtQ43v5?=
 =?us-ascii?Q?6s9qtMNYwQBUMPqyOp/0y/O7spmr7Wi2qaHVra0xHPOgnGgYQWCSP453/eSO?=
 =?us-ascii?Q?2jntZGU9LTIwpuB+plGGuLi6cR9zfqwSe21TfHBm4Ug24x5JYfwW8j6rG5/n?=
 =?us-ascii?Q?qE7F6a+Hk7NEFEVrWMd+5yUvkupzJ93OSbVtIWDChLXn4bpl45F+8+9j/Plq?=
 =?us-ascii?Q?EEjJO2eb4Dus6pMLBvdvrXlWeerawGiJ3O2rP3o/9XypSmeNBAli5ymd6E30?=
 =?us-ascii?Q?JQaOuuHdAo5VfG79TC5kMc0YhTLCAaDmflTZKMMosLhaCiSMeP6ODpHwttZT?=
 =?us-ascii?Q?+BWMuyOu+UTsT1JmJy6woMpT0HSFuz6lKZoN6FZZAGd1gGjWA0ebNZe+hoyE?=
 =?us-ascii?Q?OfjpworlLo/8Pp+1APTXo7IIA3IZedfqf0mzhrOgVU3QH1VH5jd02ptD1s0L?=
 =?us-ascii?Q?Tbj1KuaANkp77pGtvNZH1PUHPCqbppOfp/7qhkBro/HK97F7JRC7Hdj2OOd2?=
 =?us-ascii?Q?5m6+DSevqQPgyFlI/GaH/T+zF0163vgP3GRdNiZkmZBoe9++/xmgLBRl+uZr?=
 =?us-ascii?Q?cU71IJVegYCy9AbpafSe5Y8bzt4w5zL2aoS9dqLWS7qGashdRipuu0G8RQeH?=
 =?us-ascii?Q?pbS11B5Qbt0b8F020+dL2MqngEEcdE8JGe4IBfKR9kHQIqFBjoovCOktNGbv?=
 =?us-ascii?Q?EY0pfq+zJLLW9q1T5KYDs6A2SCJyv1oJeaHwlVj7eWVRnF/4khmWQddWQRy+?=
 =?us-ascii?Q?z1KownC07oTie81Q9Ultk/rX/XHWmMCUAAu2w/OM52ctKe7jt/i+ET233e9a?=
 =?us-ascii?Q?CdyON+ZKLrMfk0pNljt6i1zXcGvAnSjocHrjObBEu4E366zHV9OGTT3QSAmt?=
 =?us-ascii?Q?JsW+dTs7AaRXMejt5l+xrZ/n+pE7U3KD9gqT6F5O9Tmrl/mM0pC/GEUUB3bN?=
 =?us-ascii?Q?bTGvZfZ05FqoGgWudsecTloY6GDFw0iWVTCuYJ+KnPYi/SVUKba2CW283/nR?=
 =?us-ascii?Q?YJVw7jH4VoXKHuoheDzHfhLRQWL6vTdEOtQzBUgMXUSYheYG8YZBOkdu9iXr?=
 =?us-ascii?Q?qgWdaUwVALIMK54mGr0aSSXkm6hDiEcGQz3S4mJoSJKbWX9xQpWn2RXZI2pf?=
 =?us-ascii?Q?sToVd8toFHgSRuvR1pgbGg3pXA21OA/xeg1xCSPghb4z7jMHqyDnv9B1oEPP?=
 =?us-ascii?Q?WrpRmUq/Aj1ho9ndQacZuXoxbQih1if8DSo0tD+GR9MpkVVq9v6BQ79kGGv8?=
 =?us-ascii?Q?KORWqUkPyG28D4yOEGs7dKxFNhAL8CBgWCXisM3QppGL2B/d06IboTG8ouwd?=
 =?us-ascii?Q?FpGa8r4upPSSd+BZM0y5r9doFX7dYWAYKbw8lfcc61jxJ/yoYwsmtapOrS1n?=
 =?us-ascii?Q?i4cAmU2wpu0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5580
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	79904947-253b-4907-fffd-08dda2b28ce5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|7416014|82310400026|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lAxUJyRUlAJn3kUAc5Uvs4CoCUcQ7AfJPc0TPdCBXMJh7zIcnJSE8xTsyunS?=
 =?us-ascii?Q?DyMZIz77fECT+9nHlSk2WztqYMYbIhtIORzml3BrJk5Q0JJjniiE6D0gd0U2?=
 =?us-ascii?Q?zKLhg48fPI9sL/+utRXCvQ2kc/Aa69l86mjRY2FQ53aqA8B6FdTt8u6/RhPj?=
 =?us-ascii?Q?vMa9wMSE4l/jP7wMci0WbPbwcr+/kHzIfQRZgpCxmXFdj9W5NmrIdzZ4VS2P?=
 =?us-ascii?Q?BLH+pJsTtJrRwzRkGytwc++a6iNQ64ykXr7+lNLHV7D80WBuosxkXxzek8ep?=
 =?us-ascii?Q?wcgeMc0ClPgt8PiXYPKly63PKlwQtThKfWhIYfOqVTDxivkWplaP7Uhapstw?=
 =?us-ascii?Q?slGWMKXiyjwdwGZucJjMKsrYVSrKpXWaCykWgp4CkpIcv3jl8BowBqVj2GLE?=
 =?us-ascii?Q?c08WKWbgSUlfIc+QatKJo86K0V46IeOLVLsaDsY8uUmyJlMf+22kB6i2DvLQ?=
 =?us-ascii?Q?cLlbxzVw+mWCgTlIDjEUwKjI2IkunxT6Rd0BJatQD22hGv9kPYMtXL7ZwH0G?=
 =?us-ascii?Q?mF9y0k0hMQIBHGQo/CqHXpHkT2UVaJdjZGGHhjZl/76kmNIEzt6iSjMrD4tp?=
 =?us-ascii?Q?kGM9QMeiyCPczGqaLfImunvDNyu2GB5UdfYhS6Fze+/s5qux7BZBn3uvoNIY?=
 =?us-ascii?Q?UUiF8KM7YwGRqkqS44o9LuOszWF+wUW/3kvETg/2phh6nypfi/7Q1yt9K07S?=
 =?us-ascii?Q?sFjGsbH6WAGyX7tJnvmHX8CJVr6rTQjLNooQo0cAHrJ7sawaj8UpjRGJ/X+W?=
 =?us-ascii?Q?rXGzcXk0tqlRhoISPjbiGGyNuyBBZhxQWICvivEF9lE3fvbjd769CKXiER/6?=
 =?us-ascii?Q?/j/UnmKD5C2SEYNV8Gqf/+ACbCPNkPWpKLWvM4V931z2GiIuZaLiljFStFgT?=
 =?us-ascii?Q?yU2SiRBxQJR5l9XPCLJRpNvXCfZFvQQhasSjwJb1xFzYjGoXdL4Drv4Wgg5F?=
 =?us-ascii?Q?051hXq54cti1JxiVFjlzNUnzKegM6D5lUaxwhQ3pRb+fg25+nHZB27MFkH3b?=
 =?us-ascii?Q?lNPBP/l33blw6oC70naPYpm6c0/O8BuG2y5x1JyJyauR0XQW+iZ1iPmP42Bp?=
 =?us-ascii?Q?zaQ8Hz0sNmLw1sgvhq6YePKOIHDTB4G1xKN17VF8fPa0em9KkAPk+6xFd13v?=
 =?us-ascii?Q?5y1Xu6qP2gWVy8BVNg8Q6QQ7NTccXhKgcvGZJIZ5KPUw5V3w/Ri7wB+8G+TL?=
 =?us-ascii?Q?I85KRr+nE9f8+NoZbyFvGIBZQgZGmzChubO6UqgMzK2zHBbNiTYSHsQxDYJp?=
 =?us-ascii?Q?LvWx/p3Uxc5mjMkEbocACEDbobf3nRIZmnmjrM3iGA+ObZ6eLtK7n5SZrpX4?=
 =?us-ascii?Q?bg9x0yexHip+zx4EEeulwPXUWOU6Db2jOCHQS6HSjTa0XyX8caBsFJx9oUV2?=
 =?us-ascii?Q?HeZnmXrEIdthtvsJfWGjvoR+p04hYxGKFXE5qVobfUaiU3fmHpdqxhd0ASWM?=
 =?us-ascii?Q?M3ZifOAF20EgkFVOtC3oqmzNG0TCb/JWzfmcH0+CNoR0IzFdqf6g4bHSC9bp?=
 =?us-ascii?Q?FFAJNjpa9IZtuPbBl4D4b1XrYN/bOS07KJ7C?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(7416014)(82310400026)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:23:44.6140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a923ba6f-d53d-45fd-5ac3-08dda2b2a11a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5741

Hi Mark,

> On Tue, Jun 03, 2025 at 12:14:18PM +0100, Yeoreum Yun wrote:
> > > On Mon, Jun 02, 2025 at 06:50:53PM +0100, Yeoreum Yun wrote:
> > > > So, what I think:
> > > >   1. arm64_enter_el1_dbg() should ct_nmi_enter() as it is.
> > > >   2. in bug_handler() while handling BUG_TYPE, add above ct_nmi_exit()
> > > >      conditional call.
> > > >   3. DAIF.D and DAIF.A handling.
> > >
> > > No, that is not safe. In step 2, calling ct_nmi_exit() would undo *all*
> > > of the ct_nmi_enter() logic, and may stop RCU from watching if the
> > > exception was entered from some intermediate/inconsistent state.
> >
> > Yes if call ct_nmi_enter() without condition.
> > But I imply with the condition check what I posted.
> > if CT_NESTING_IRQ_NONIDLE,
> > it wouldn't need call and that cpu can be watched by RCU.
>
> I am not keen on conditionally calling ct_nmi_exit(), and would strongly
> prefer to avoid that, regardless of where that lives in the flow.
>
> I suspect that it would be bettter to triage the interrupted context
> earlier, and rethink the way entry/exit works, but that's a much larger
> bit of work and will take more thinking.

Thanks for sharing your thought.
I'll think about it and let me raise it again after ada's patchset is
merged.


--
Sincerely,
Yeoreum Yun
