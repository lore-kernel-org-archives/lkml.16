Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A757213E77
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.71
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440317; cv=fail; b=j/zdLzYJRPj4R5U+9BOTEIJ65uA7upXq49EDhwwENDA8M1pv93IZwUZhaPe11xme6dFkGG16t00YZvKVtPo1Kbpo0X4NPXsdsG0J+MY0r2GUY+1mNUNVCLwT1VP3Ka0lBd6T3AifWQ4WPOKC1975X+DshaTjGJDtPfXBEkq5AcA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440317; c=relaxed/simple;
	bh=9D8EteY3iXyEIq5EiFPKEeDQV5Ggo2YfL5gJh7mRAao=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ouEml1X6h72dsNFTW1o/JYt6qbpo+0SCut9BYboneWlLMG7l4/f/Guc3kxQz/0TuHImF80+ngSVh+QUPuFTI9sA3B5+kbggTrZD1rJv9avdv4xaHBLhnoltWR6KKSqgpHqiRE99z5Gx60zWtD7i1bMESCjIYEe6omeZkvX+plts=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mxHsc/RO; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mxHsc/RO; arc=fail smtp.client-ip=40.107.20.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mxHsc/RO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mxHsc/RO"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=geTiJfwZ5S4BieszYxqxMJ4b5H0xmuKDKwYHiDv5Nk0uKwQem8i2BuHjt8bMQQKjAVeifnM2DO6zy+d5tdTalOymtxyEZmzmPD3t2bWI+od1UEPpChY5zsNLEWFCFsmWYFnme0lVPwnXec4MI9ITPDRyhPV1edcRhl24sM1IWa/epQbYWd5BeuNga4SeVWIPIQ3tceLEHXyy9irBpAyqsf4ly7TLRZrZzlUQUn0HpU4GieOze8OdLCI78F+gqQaHtnaFvwKx7SbObgxRSgljzg1n2g6r9e1NVbRqoptrR3Mf2Z9RQVABgXPsEVQFDSdQiBTUs4BRjWU7ipYoL857dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D8EteY3iXyEIq5EiFPKEeDQV5Ggo2YfL5gJh7mRAao=;
 b=eIkaCM9yz323R+oY0b8CjLsqQ8mLD1Qqjoz+YVxdYgbnwOwpLm50nuHAPz76E5cfWNYSALlb8w9a++MVf6YeqAt+13RjdkyiE9RW3b83rn213M4ZngH6mrhlPfrylN3Ec9aUxzAsZfR7sDRzfhYQGdzZyh1O/7NcAbXhCLTQgkfxoIbSwB7D9L67hvYRESO/sxorRfHAJEbG0Y5eEuzJyW57IFzqHM9rEwvYz34Y6rAHNNGjXewRLT7gE8gezjg3rvtNPQ+nylDXfnzOaVmmgEISOFhF8OAAbSKPCMg4UlAGOIRl9cvXzNORKUotnGscPO0P/9qan0p6I8DD3V9RtQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9D8EteY3iXyEIq5EiFPKEeDQV5Ggo2YfL5gJh7mRAao=;
 b=mxHsc/ROqvvp67xW7tsdJndg5KULC1OhgWcch9R9gIB9EzzsHsGUJTE1SLvcf1lWGpX5iHvb5OPaOPlgVZ8sHGQ9w5wHLT8XOFBGumyrcKRX7zJKEfndj5LwRUR4D3uJmw3sStKCRw381+kW7rueH4EdDd2SNjI17jptldT45xk=
Received: from DU2PR04CA0089.eurprd04.prod.outlook.com (2603:10a6:10:232::34)
 by AM8PR08MB5716.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 16:58:29 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::22) by DU2PR04CA0089.outlook.office365.com
 (2603:10a6:10:232::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Mon,
 31 Mar 2025 16:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 31 Mar 2025 16:58:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXfZtl7XofWffNQS+HmRAS2EaDJ/9+eJziEjfOEVPt5dEsW5Jwx2qvCLkC1iPKlUxmB18bQ2nDEe1+M8At1xMUJlNKgqAcO1uSkXaKAFNlqBHF+6c6JGbTNh1G4v2JhIEPgZiNok32WDC5rckIzutvPtgE2dpEuTx7uJl/ajLkBK7BQ/7enE6O3ULfLn8QOMbU9EpwGVJheOwrpYYORxjCnToliumHvIxCkTd74cpr+BMB7wnkx0BzORyXXwHJvBpKp5v2J7nEsung4nFV5cHJxsnDXMTpNzSnyEasg9WNC8qT9BIqVjhRBja/Yk8UgaBLM3i0pq7fIbJPKVkzIvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D8EteY3iXyEIq5EiFPKEeDQV5Ggo2YfL5gJh7mRAao=;
 b=s7p1iQuOuYJRmsyD6ATreAeiTpLsGvZyN1b+kbqYwd2k1+DvcjiwfORe7YZs2D/JV7bBDemWzHBhEVkgPPDOMFwisr4T2SQOr5ochG0iEwa8kRauqkq4f84wSeWQOpGiXy4wtMC4UeoNI9rkei2qTIi0nhNrX1tO2l1pCoaN+kqSzC90B41QPKD08RFUDYMLMC5sXpOFSZn4S/DHsp+0KasBtNvzo0q8elbE9f3NtNamqkoQlnWxhmrCfcO8Bca5bF7tPwSu9uon1/xInW3Mbb3VYkGmkJzsmoFck+IoOPgbeLXwesVzMkCUq/XlQIEqmB5BYeSBHWbVS/bEoDaCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9D8EteY3iXyEIq5EiFPKEeDQV5Ggo2YfL5gJh7mRAao=;
 b=mxHsc/ROqvvp67xW7tsdJndg5KULC1OhgWcch9R9gIB9EzzsHsGUJTE1SLvcf1lWGpX5iHvb5OPaOPlgVZ8sHGQ9w5wHLT8XOFBGumyrcKRX7zJKEfndj5LwRUR4D3uJmw3sStKCRw381+kW7rueH4EdDd2SNjI17jptldT45xk=
Received: from DB9PR08MB7582.eurprd08.prod.outlook.com (2603:10a6:10:306::18)
 by DB3PR08MB9112.eurprd08.prod.outlook.com (2603:10a6:10:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 16:57:53 +0000
Received: from DB9PR08MB7582.eurprd08.prod.outlook.com
 ([fe80::5842:a520:1b0:45ea]) by DB9PR08MB7582.eurprd08.prod.outlook.com
 ([fe80::5842:a520:1b0:45ea%6]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 16:57:53 +0000
From: Christian Loehle <Christian.Loehle@arm.com>
To: "pr-tracker-bot@kernel.org" <pr-tracker-bot@kernel.org>, Steven Rostedt
	<rostedt@goodmis.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>, Christian Loehle
	<Christian.Loehle@arm.com>, Hongyan Xia <Hongyan.Xia2@arm.com>, LKML
	<linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark
 Rutland <Mark.Rutland@arm.com>, Mathieu Desnoyers
	<mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>,
	Haiyue Wang <haiyuewa@163.com>, Jiapeng Chong
	<jiapeng.chong@linux.alibaba.com>, Sasha Levin <sashal@kernel.org>, Sven
 Schnelle <svens@linux.ibm.com>, Tengda Wu <wutengda@huaweicloud.com>
Subject: Re: [GIT PULL] ftrace: Updates for 6.15
Thread-Topic: [GIT PULL] ftrace: Updates for 6.15
Thread-Index: AQHbnd8kOiUuXhzAS0Ky4F1RFQAnHLOHr7uAgAXNn10=
Date: Mon, 31 Mar 2025 16:57:53 +0000
Message-ID:
 <DB9PR08MB75820599801BAD118D123D7D93AD2@DB9PR08MB7582.eurprd08.prod.outlook.com>
References: <20250325193935.66020aa3@gandalf.local.home>
 <174312059712.2290382.15769886213616422661.pr-tracker-bot@kernel.org>
In-Reply-To:
 <174312059712.2290382.15769886213616422661.pr-tracker-bot@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB7582:EE_|DB3PR08MB9112:EE_|DU6PEPF0000B61E:EE_|AM8PR08MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: b6954bbb-e955-4667-4e0a-08dd7075417d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?Jc4oGL+2YjhHFZY1MrT4co9Y/18XN/rf+9M0Q35kQ+9BW3Ux8g+qPTF1Hx?=
 =?iso-8859-1?Q?RIEGmxZnrHYvulzX35nqGUGm3r8S7tH0YkYCzBHdbm7lul+T5B5z13BaNN?=
 =?iso-8859-1?Q?BhbZwN21ndnrY8+FzuQtGzbmBxwi5DvWgqwedc6ZRSMVTQeiG0wfmXCUyD?=
 =?iso-8859-1?Q?TBoliDFg7AatCP8PthGd7kfy+PE2meBGHbproWErxjCpvoUxfZl+xRRcfR?=
 =?iso-8859-1?Q?pvEoGHp9MWwCTpOg5hRKrajAOPfC/BJz1nMlTGQjzW3D+PdqyjRHYY0MPz?=
 =?iso-8859-1?Q?HpHPN7XLarSqPcxzNgZbUgrC/axRnSVUWHyKau2tRu0qVznjxnuQcm3DYz?=
 =?iso-8859-1?Q?O25BvUdStrM8gXvLlKZp4rDRV18IL4kC6JmJP2Qo8UU+tU7CYIQEYfS3xM?=
 =?iso-8859-1?Q?QSjvFXB0MpgZPl3OTV6MRo+e/CkUWuieUrNQTtguC4khFlm/9aQos/H7+1?=
 =?iso-8859-1?Q?yobTnKyzwrT3bh5Lr5pf1+g/BlARDoRK198chRkuW+F/QRCGTwPnADoj0s?=
 =?iso-8859-1?Q?KiHoWFACxQCAv0dDYHAvniptanRsOqKbIWtxkXiCSk+kcnyeODZuAJu8Hq?=
 =?iso-8859-1?Q?c8Gnec81DjkWXHL3TyiBysnos06dJX+fAFKZ1LimYIZKbgaxpLwbTdSAJJ?=
 =?iso-8859-1?Q?IRFt36ATRpLRjzGMzm9YcdJYPrBOkN684nLExHrI3T/w6Rme88GdorjY/0?=
 =?iso-8859-1?Q?R1qYHEbftCjSx0Z8ruq4Ezlm/0Ppit9S9Bzj6FQIu22SCZe3fuFfTDXNru?=
 =?iso-8859-1?Q?ynkxUuxS7WfkY6KcvyW0SzmVeOkynem794TurN9vyLmA+bWKsdJrGONdxC?=
 =?iso-8859-1?Q?RFJtOMnBeEHA7gjBURModgRBX3s2mAZW/guwrCenqY8bvSO4kk9keOnNiA?=
 =?iso-8859-1?Q?FZGJEnBKJ7ncev78M9vpzuRhH0FvuQ0YnIn2o2ZpLXvWrDgQ/xjCSVOSwf?=
 =?iso-8859-1?Q?uqfaUdNgMXOkmCDvgaTf01TR+F/wojCQmLcAkwqZyTZHeA4ROo18AqSKdn?=
 =?iso-8859-1?Q?f6kXLKXpw31nV0KnncmaXkxT/kIEsuiERd6msZSu/8rjxd4mChu4Alol4u?=
 =?iso-8859-1?Q?0DEeVjEtsEz3Ga/DL1kE5/xed40FqQMyC+dlBRJV3WXT8SMfKlf6NeakCu?=
 =?iso-8859-1?Q?U3QugBCHk+aJb+cuPWCpDVzlo8kpjZLl4tnac80BQsNe2tRe5oAy6a8JDc?=
 =?iso-8859-1?Q?mPA11bemp6W310WI5IWufNiuJqFC+OBLSUhOa3Nhg1buSOxQqVwvWETroZ?=
 =?iso-8859-1?Q?/tZGxV6DNIxgWbTJKikcKVPd6QaxfkMjnkRXrG/8qIGOB2NIOwv8werXz5?=
 =?iso-8859-1?Q?4WYftjgNzU5Mwn6idMopQ7p1fZ0pVrVPzkHeWk8L8O0JvAs0A+UG3Id8Lj?=
 =?iso-8859-1?Q?Xf+9XtOAWmMgVnCgnXbpJpGYPS8HH5IUVyHs2VBOhDqwGeX3MANQpKVVGn?=
 =?iso-8859-1?Q?CKcauq/2sIA6zpaAVKvcpXyzUC2WWanAgPTuQw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7582.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9112
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1147b80-af12-4810-5112-08dd70752d6d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|35042699022|1800799024|14060799003|82310400026|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?/Ue2QgrN7RX/MkKKPsMXO1548mgXX78kTXblIRAwL60nvN/qRsljp8A9cK?=
 =?iso-8859-1?Q?dGHPF+W4AKR/1R8v7vLZaEgkn5vz06ZT/iMSWHVbhEoAPKQSx9DS3vV/hb?=
 =?iso-8859-1?Q?IfUQfpmWu4ovy8AFkb16ufWiIlFhvetLmdeLc19KCOHydvkOz4RTjp2Tgs?=
 =?iso-8859-1?Q?V7nzQiC+JZSXSRriej9uZAAOr3VhbcQZdp9H+NAsgqudPnp27qAKoxtH0Y?=
 =?iso-8859-1?Q?5lJdIs2Jyvp8mYLbUOTZmO/wHCor232P6LdDuP2MwnPLMRUUa3YM3v+afo?=
 =?iso-8859-1?Q?mKkqCWf35Y7weQV3iVeSoWeFan+n67/jPBMY8fGD5/SfTjnLdbtDh5Isqt?=
 =?iso-8859-1?Q?5azNhlvWpjt1ZebZG2kLaOYRdLTmMFnUqeuQiwl1rFVKahQuZPPVtDgZNd?=
 =?iso-8859-1?Q?fgVVrkZN39EUpddOYtbsBm1/Yk2DRHT8Aac+IXYzKpWRalCgNEoZX7SEIp?=
 =?iso-8859-1?Q?3emAjg41A/B2ggRxQDm5lyjT0/qSa5v02l78Z5UjC556spgEalsnhoeSCt?=
 =?iso-8859-1?Q?2zL8/gkchbdAXW9bKSGdiTtXi+opC95oCDELyWmqifRRE1csgMjzIH21gv?=
 =?iso-8859-1?Q?homo69CyYai++zZEKiOE30AFs5U8wJH9ZtArfjAr3Al0ftMRr1+gHHzjfA?=
 =?iso-8859-1?Q?R54mXkfrqVpFdMJMW4MkQAvn7cCEQjdSNubVH6PJJ0UHG6qmPOa5wqB3uj?=
 =?iso-8859-1?Q?VfaXuAwP7KZ/pdSkuFFp7CMCLNxbOzWVxUpK8SNSrw5mVCQ2aOAxRiXBcG?=
 =?iso-8859-1?Q?TyDLps2CbFBwtIed0RIWFJe2FtcnXoLOoDJ64aNsqNgbSmfDEJmFbf9KSW?=
 =?iso-8859-1?Q?093649ECatV6/lDB/Et/zYksO8ho77ibEhsbifgkU0fqRQlCSV8MJcWBiV?=
 =?iso-8859-1?Q?zEcknU66ASMdDzaieErmLtbfaS5SCTUD4GH34dx9AvMu1xeO0D8Izamrqm?=
 =?iso-8859-1?Q?c4F5xEKcBs46Mk5kWfttvwh+tPPUR5ivWPuhdX6YUCyNhOopzema338935?=
 =?iso-8859-1?Q?qCYey8cQN57OwBc7+3dfswWU2RzpXQV1DIkj8RDZX758ml3vYCSUYjGpEu?=
 =?iso-8859-1?Q?o21rgm5/ynJgL20jv7ex5RcTmaqmAkf6dnXUL95Q/8CxVG4Bm/1OQBRzP9?=
 =?iso-8859-1?Q?PhkCO0pMf3n7Fo5wT0lJ0Sn4F1aQVarlX9Rknie7vRfpKrKP8E3EkqAeBr?=
 =?iso-8859-1?Q?UbjnVWg/DmKbiE6v8ZjyP0Zf9DTdm6G8/QXMgpwsqPqsPiGT0sn2J3Xseb?=
 =?iso-8859-1?Q?NcY+CFjAtNuIyuvPLeb3BYtWrT20+Y5kkWA8dQJtcqPLEUAsBlhqof+s40?=
 =?iso-8859-1?Q?ciukwsvkPzgYgzYlY8fyDm/T70CNsfwquGTE2NO372F9CLqE1jxBP1+e93?=
 =?iso-8859-1?Q?IiqVWbPhMSlNvgwrh5BA719Ha+eND2PLys3iNs7bI6ffphCjn2d0s6ip6/?=
 =?iso-8859-1?Q?sOfyxnHR0hcuI8vK/6I8j7wyoRE0hVywZR99T7ONQULOlHSaT5KdYM9CL6?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(35042699022)(1800799024)(14060799003)(82310400026)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:58:26.7756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6954bbb-e955-4667-4e0a-08dd7075417d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5716

=0A=
=0A=
________________________________________=0A=
From:=A0pr-tracker-bot@kernel.org <pr-tracker-bot@kernel.org>=0A=
Sent:=A028 March 2025 00:09=0A=
To:=A0Steven Rostedt <rostedt@goodmis.org>=0A=
Cc:=A0Linus Torvalds <torvalds@linux-foundation.org>; LKML <linux-kernel@vg=
er.kernel.org>; Masami Hiramatsu <mhiramat@kernel.org>; Mark Rutland <Mark.=
Rutland@arm.com>; Mathieu Desnoyers <mathieu.desnoyers@efficios.com>; Andre=
w Morton <akpm@linux-foundation.org>; Haiyue Wang <haiyuewa@163.com>; Jiape=
ng Chong <jiapeng.chong@linux.alibaba.com>; Sasha Levin <sashal@kernel.org>=
; Sven Schnelle <svens@linux.ibm.com>; Tengda Wu <wutengda@huaweicloud.com>=
=0A=
Subject:=A0Re: [GIT PULL] ftrace: Updates for 6.15=0A=
=A0=0A=
=A0=0A=
>The pull request you sent on Tue, 25 Mar 2025 19:39:35 -0400:=0A=
>=0A=
>> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git ftra=
ce-v6.15=0A=
>=0A=
>has been merged into torvalds/linux.git:=0A=
>https://git.kernel.org/torvalds/c/31eb415bf6f06c90fdd9b635caf3a6c5110a38b6=
=0A=
>=0A=
>Thank you!=0A=
>=0A=
>--=0A=
>Deet-doot-dot, I am a bot.=0A=
>https://korg.docs.kernel.org/prtracker.html=0A=
=0A=
Hi Steven,=0A=
I'm pretty sure this causes the build to fail on linus' tree and next:=0A=
4e82c87058f4 (HEAD -> master, origin/master, origin/HEAD) Merge tag 'rust-6=
.15' of git://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux=0A=
=0A=
aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!=0A=
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!=0A=
aarch64-linux-gnu-ld: kernel/trace/trace_output.o: in function `print_funct=
ion_args':=0A=
/home/chrloe01/development/linux-mainline/kernel/trace/trace_output.c:712: =
undefined reference to `btf_find_func_proto'=0A=
aarch64-linux-gnu-ld: /home/chrloe01/development/linux-mainline/kernel/trac=
e/trace_output.c:716: undefined reference to `btf_get_func_param'=0A=
make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1=0A=
make[1]: *** [/data_nvme1n1/chrloe01/development/linux-mainline/Makefile:12=
34: vmlinux] Error 2=0A=
make: *** [Makefile:251: __sub-make] Error 2=0A=
=0A=
Sound familiar?=0A=
grep BTF .config=0A=
CONFIG_DEBUG_INFO_BTF=3Dy=0A=
CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy=0A=
CONFIG_DEBUG_INFO_BTF_MODULES=3Dy=0A=
# CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set=0A=
=0A=
Enabling CONFIG_PROBE_EVENTS_BTF_ARGS passes the build.=0A=
=0A=
=0A=
