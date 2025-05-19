Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181C153BD9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.52
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642570; cv=fail; b=jHxyWQQPEwOU6rgdg2PcIjItZfw3LlqZ6Wnpe4NB+C2lwGjQXXmTlvbEJHN53NQhlbYw5ORy36Sq/O22mwzjE/Q/A2iYCSa9VafTMePJ1uDIhLssGaDOGFfIBA8XIMMIX2kNe+mJj6isP6SvuS+GZUl0CvmhRGHOewGHWeD6jo0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642570; c=relaxed/simple;
	bh=4zXnQejk0+E5uK09ZOXZibSF5t/WhWSUiOnRnKm3PLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qHBqWHJqbXAATa0wTmBgWzU9W2K6/oik9Y1yV5fXYwK00TFYrbntsbH0DOiQvc6FE0j6lJfzwE4gFPDW5KkJYOOa4ddrUpLnaMUIINM43qnKMQ8ftFwO5dQaQ1LJyd0ejE6Tm20lxtftMbZponXp37NWNtmnzZWEtOtCU/f7iBc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=arzuYbtN; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=arzuYbtN; arc=fail smtp.client-ip=40.107.20.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="arzuYbtN";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="arzuYbtN"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fXUQN1P3YkljB7w8D3kPhmCGdecsRgO1rmtlpl6TYNv6lUaz8On4uxCbFHp2jPtvHSl4BlxaTZHw3Q/qXZeICY8zHH1xcKYZ21ZCkBjNbQIwed0qJeTd/kFXTleqlMHng98i1dskDf/iIk1wcAPZa9QZ1IAGxPzVMLKkerOnLXIDWFoIkwkSHoy71WpPbC4j+JMxXXST8TsyqNRq6ZvURUVN1oEwzdSKqtWsbLTiLoRU0u66qJZKkwET3inODurszb2I5J7pccxKZ13/KhfROxKtOYFeCT56O+n+7xDVGL3HYzBi38GWMvtZvdkM0eyww7lIN4MQlVC+E3ek1TLWmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ2Adqy7gaN42s1vXoAfRzIu2VuU3o2KysWpXbynaug=;
 b=N3lMDr+oU/1ZYLm9tmI4MtuvcoMUZQFQkAlnjzGGNbFwOyAOvaYZU9QKzcOLjLu7/c5sbJv708vjJ8slIj98qDKKm9My9g/gv8qthgtdoRhW384ZkObp4vhPPEqYUc/9MVu+Z+vXPR5DvtXNnOQQg462lA/9Ccw807OASgrvDepID7WjyM+0rP2maFk9CCe4wuYfobYXasB8A66ukyGJ/qYOyW8FI7rRzM6yp3y3A1v4DMm5tuEdIYsKidDRW+sm0FIahKtde3VaGuK0pBFqQZP77kbhnBk+NwObwjBDJX1NduGf9rOOyG/fgEynqPh5ENo9ruJGZO6+4GVkwAK9Zg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=google.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJ2Adqy7gaN42s1vXoAfRzIu2VuU3o2KysWpXbynaug=;
 b=arzuYbtNPbjqLwzkfVbpmBbMfnvdsRfdObOQ/04AcYqnJRIAiKDVh4DfjEuFPOQtqvYUuD6diNK3S450Ac/YjSzuj4kjIlQ9BqWPpVUSS75T1wCq9Hhw28FDEC18DIawk87QYJgWz/2gexHBSdpL5M0zBHBQ5M5Qg57D4cbddPs=
Received: from CWLP265CA0466.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::14)
 by PR3PR08MB5817.eurprd08.prod.outlook.com (2603:10a6:102:82::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 08:16:04 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:400:1d4:cafe::66) by CWLP265CA0466.outlook.office365.com
 (2603:10a6:400:1d4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Mon,
 19 May 2025 08:16:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Mon, 19 May 2025 08:16:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzmZCENWGzHxhQwJPu2VbN/gG8DAbyjrKWAJKYAMBERg2XasxcU9VAjLMIw4k0iZrlY1T1wxOvsByzRAtQI1P55PJLIA5EpRU4AZXnx77BC0xi2fAZ7m7Xbx+tk5DRLUVCUc8MRrUh+nD5wh8YWXYg8oKyZ0RnjlSF7XfHK2CnxRhkhVTDpIDJ1lUdBOMC1ruOtsW9q9pCr6eGh8p6nNhiD5mJIMbQgK44IbupWhRTpuqfAif83+1bp+iDaUkbxiqzJo/HEjG57mMFANJIZ4HrU2PIJQF6mmqyE55t8uPJvpKfvoraHiSRLc60sKZHDWxrBgwvgd4xccOA67QrFfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ2Adqy7gaN42s1vXoAfRzIu2VuU3o2KysWpXbynaug=;
 b=X1Vmv6xs/XCe/4iDRPV/WE/gNfZKL/qLY0Ekmi9ymxuNlr1dTsrwN3uktc0GZEzFFsbbfwZ0AGkHkLflqyyi14mD9o2l7Cq2ok6jHlMH9DRys5uJ2KZA80JPqePjZHl3TpR/JlJ12Vsll6ej7b7iOwI/MWzJ8YkG4o9y71YjUU+3LTuvJP+jMSfUK6mKkxQiZA8D25BRu/b1JJztzxY4yYWcjLYIDb9+iqF/xfvSAU7PY3KvN7VNiFwhe7iH/q0tWtyJ3XHoQp3pCNPPivvcm+qly+61WOO9C6SM4OCehDJfFY9PMMFfVgwe/nL38VftaqRvwXLJCjtDkGl+rDpS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJ2Adqy7gaN42s1vXoAfRzIu2VuU3o2KysWpXbynaug=;
 b=arzuYbtNPbjqLwzkfVbpmBbMfnvdsRfdObOQ/04AcYqnJRIAiKDVh4DfjEuFPOQtqvYUuD6diNK3S450Ac/YjSzuj4kjIlQ9BqWPpVUSS75T1wCq9Hhw28FDEC18DIawk87QYJgWz/2gexHBSdpL5M0zBHBQ5M5Qg57D4cbddPs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAXPR08MB6414.eurprd08.prod.outlook.com
 (2603:10a6:102:12e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 19 May
 2025 08:15:30 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 08:15:30 +0000
Date: Mon, 19 May 2025 09:15:27 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	maco@android.com, joel@joelfernandes.org, brauner@kernel.org,
	mllamas@google.com, surenb@google.com, linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreun.yun@arm.com>, Yunseong Kim <ysk@kzalloc.com>
Subject: Re: [PATCH] driver/android/binderfs: fix race for binderfs' devices
 list
Message-ID: <aCron3VfqAfRAfXs@e129823.arm.com>
References: <20250513174719.3096063-1-yeoreum.yun@arm.com>
 <aCjGSx2TvQdECBT9@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCjGSx2TvQdECBT9@google.com>
X-ClientProxiedBy: LO4P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::7) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|PAXPR08MB6414:EE_|AMS1EPF0000004C:EE_|PR3PR08MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdff785-ab8d-4759-0292-08dd96ad65b2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?5KeeIjFXbXV0GqLCgpyQv03S+VSQHPl7/0yDkTWsKDWmcp2SSK0CzJiLdKem?=
 =?us-ascii?Q?8MbYOcth0VjWvWG8f/EL01wXZ+57BtKkFo+x6JRzPgT652BnZ6M6nAjIUIdh?=
 =?us-ascii?Q?dDmshmqvgGadyFAalSiFPacGMFLBeLq5ohCb30P7cxEK9m2O6IwjNSbqARYT?=
 =?us-ascii?Q?5a4h2DDjZBH8A3CitCFKRIU8+ZfkvLQ/qZMigcWME4XhVDtzivrixzC9vwAb?=
 =?us-ascii?Q?KX1dtuhXGEX0lk9OqM8sFKz/5KZAYidzQptgj/V7uN5FJwYbHFRZ3H3+ollv?=
 =?us-ascii?Q?GaUcxCgW1gwXvyUcUiZXdeC4vMv014G63Vr0iUzvsKTw4nBbR2w2b5mGWs9g?=
 =?us-ascii?Q?l+5az51Op2dtM17VmoqN6ELaMw1B2/i0ui7P0vwvjWwnv0iqT227DXhzF2JV?=
 =?us-ascii?Q?bxaskx6lQzFq+sTEoxGXoLZOssOBnE4lN2Sn7krNXVuGK6ozO2kHiitjN366?=
 =?us-ascii?Q?Fftb7VSdLPrbnEm0BjcH6tDnAKIDeDn5WCphMK/uLoum+7h3FSjrGXzNfYM4?=
 =?us-ascii?Q?Xbd2d22+nDCjKCi4V00HCv0EXihnYCVWOMIEvJrgY9F7k6MMV2UfE2saEsHX?=
 =?us-ascii?Q?mNaABnyrIB/EAJWyW4T4HX51EBRUfckedqtaSGL+CwkM8HF8maR2ECCBCeas?=
 =?us-ascii?Q?tYKAAwseKBGJneIOJhHf1L9boWRJZ+el1tQzIx4nOaeWjoLizlUTRZkCIp49?=
 =?us-ascii?Q?RIbuJ/7BlbrORh2th5/XIgjqd7FOzVBGPfBJbBMKZP2W6RJE91EJWujjcNok?=
 =?us-ascii?Q?yXLph7ngMMwBvHWrfX9jaja16C2+cNfGFUgKdSrfQ67wQRT14TgCat71mQgR?=
 =?us-ascii?Q?yBfvEA0ErfgZZOwqUK8i0y7e8ebUJsNY8WllMeIiRFJEK0IcOaGuTNBC4TtM?=
 =?us-ascii?Q?3AkWBFt/d53V9QrVme3NNO2363UoopijcP0IHebt30CTs39fv3npBmudCWo2?=
 =?us-ascii?Q?m2Qp5qeuE1pQvnDCHKWCBobhNnVkFRz5OjJoUsUYvi8Rpb2gabKmMgw8YtkC?=
 =?us-ascii?Q?QvmHqsLRpWH8MEm+YN41EnyGexnHLC4HOWek/HQcWL83thJLZGwBuhVCjuYp?=
 =?us-ascii?Q?kz8qQ4dXB9vqCFDEWzoYmf9ncBwpjG2DOfykPfhXcWhhJ31OPK4QsSzsDmGd?=
 =?us-ascii?Q?lrKitRpXtqsxpdSa1LcBlVhB1z33aHVOJtXkyHTZvQJx718FMnHoTEYPPpX8?=
 =?us-ascii?Q?5YccEZ8H7BSetlA8G33GUJ136Gj+6xnMaZcgCcYjRQI96j2XqQ9ZOgTndePg?=
 =?us-ascii?Q?fzY4cTW5Ksn7rdN86xVwkiWJaMkAgE5U9Yj4iSu5jg7fosGVMOPgSz8z7LsH?=
 =?us-ascii?Q?EUQX/hKKP4ILy0w4cRCYTTT2MKsINCv1EulwT7vXXp0b4GLxo1fP308FW1EI?=
 =?us-ascii?Q?ZNoW1yTl7oMBHe9fLoM5eEPGjhb0r7g/nGAGtmFx61wtRIiF/oOkwXFcWsFn?=
 =?us-ascii?Q?SELX9l/PNaQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6414
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47fe0a61-69cf-4d65-5c49-08dd96ad5196
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|7416014|376014|35042699022|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?au2SmqdNLNt+4uxa7LZd1Dzw3QEX6nRFAi07MKAQiKxlMMiKSD1V8OFV5fez?=
 =?us-ascii?Q?jDg658/NkLuhl0N7DZgmO1MbJKJO2ViN38wBLppUdVxrdVzd33vxUv4YE9Lh?=
 =?us-ascii?Q?vWH4NmzwS4JCv32DN/6LfG8gVK4GUngsNLapNVlavFtiThUOptAOYuGiVjgT?=
 =?us-ascii?Q?7e5mZyR0VUGBfoZFzjXisPKrhFEll7u2OrW9LWkKpJc91sCqEWPtpHcIQqFY?=
 =?us-ascii?Q?cNv7bgjGTUVBCVLrTVeH7qmh2a9QwILykljIfzwSKg/KgXDLkprzOnMG0Q8T?=
 =?us-ascii?Q?yPvWrbp3PZL6ZgXZaQlc1cLwx5H43SgfAqLmzZrs5rmdlN9H1fR1r/zVWjRB?=
 =?us-ascii?Q?PBnXhVDKMVHg5OoiJmCTQ9OCSpmxvpVmiZ6ZihHj6+WGIy/Caa21jEaGHTvw?=
 =?us-ascii?Q?SP30vmrbErCdW3rqN5XQGXxDfw77enkQoE16u2SyTBVYQSYTRNYcUCzARABr?=
 =?us-ascii?Q?+mhwKe8e5bloWYXvsNxe5XvQ/hFa8fWy/s8hrj170iX4SO523dhd7NzgEuKN?=
 =?us-ascii?Q?b7K/W5VtkWxcGJQWIYUHzh8NOWgkOXvops26bmIzSUL/8abAGKfSySFAfIcP?=
 =?us-ascii?Q?uLirC1fzM3fQw0pH28QeKYv1S8g308rJtKtiMX4oKgS4etHZx3gnA2z9J1/d?=
 =?us-ascii?Q?I+IoMZfUK5rOyauxZuTTHJZmnPUTHkZOPGmZjPAyRn8AzfLLF3RZszuwF4zn?=
 =?us-ascii?Q?r0BrCpb/mzO7Bv6jtHSlKGlvrOOFLHLtmKj9hd1+WLpwZwMh9/6zsFx2XPUl?=
 =?us-ascii?Q?UwigpdRXjVkqMW3Gmv//V0UPCeRCSzjkPv6YuCvNWywtgYSK9+eA7oXe2hJ2?=
 =?us-ascii?Q?zqTN6RzKExr1iWZY8kBGTfEWAjsEaeDRd/nF2p03szMZ+FjNIyRrK70IOwJ8?=
 =?us-ascii?Q?P5lX5UioGn8jbKbxZxRFGKUhahLw8qru099hDmw3jqP9wtPYUhPZjRq73OaQ?=
 =?us-ascii?Q?ZRY78LtVaEQH8Jg6kluBes/ebC/o21URSrvAGmb4Wu7IHNQza7HocPu5w+5H?=
 =?us-ascii?Q?2jdf5uCeYtyUcZ9tVXEl2fwHmpAdy+87ZWdCewCdTzf05PoAc+eR00pRSTxg?=
 =?us-ascii?Q?KjilbObO1xat8DvCvChyvDwGla9CVc1Xefk6S2ynyl+X2cU5Qmp9whzo8fOa?=
 =?us-ascii?Q?+zg9MwNw6RIrZ28c6QFyS+CaxqdzFNRyRcooHylJnTYeSRaLktWb8u20Vz4W?=
 =?us-ascii?Q?4lLG9XJ6F+FHedF2t8yY6cx077eXI6WR4FGWipJ/rPLmD3Lb4SmrNsdbc9UD?=
 =?us-ascii?Q?fS5Lf6BHREwIEte4UHXCldtGOZGd+WfbzG0srS5OztrqKfeDCEVDgjQOaQwp?=
 =?us-ascii?Q?WOfA0g/DAlYnUYerVzIljJYbSl+EnoJpbb8g8Bfpde+J0MAHSRzeqr5jdvkr?=
 =?us-ascii?Q?qC4CGixYePD6e/dpEsM5/bCKzPZhbudalRyLT0eY5rOpJN9uSnaRkjLDXS+L?=
 =?us-ascii?Q?wkeseCTRPrxzmH215JE5Gqpu66T7n95qQW3INPtoyEG2i3VTUaLe7zdYjeQ7?=
 =?us-ascii?Q?Vx/U9dEDg2FTPzA5gnW5yM1w5oDp27759ih8T4JP2cibbhPhUyVlINTjhQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(376014)(35042699022)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:16:03.3354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdff785-ab8d-4759-0292-08dd96ad65b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5817

Hi Carlos,

> On Tue, May 13, 2025 at 06:47:19PM +0100, Yeoreum Yun wrote:
> > binderfs' devices list is global list and can be accesed by multi-thread
> > while unmount binder device.
> > Since there is no proper locking, it can meet datarace problem.
> > for example it's one of case reported UAF while binderfs_evict_inode()
> > removes binder device:
> >
> > sudo ./stress-ng --binderfs 8 --binderfs-ops 10000 -t 15 \
> >   --pathological --timestamp --tz --syslog --perf --no-rand-seed \
> >   --times --metrics --klog-check --status 5 -x smi -v --interrupts --change-cpu
>
> I just found this by chance (there is a typo on my email). Note this was
> already fixed here:
> https://lore.kernel.org/all/20250324132427.922495-1-dmantipov@yandex.ru/

Thanks. I didn't know that :)

--
Sincerely,
Yeoreum Yun
