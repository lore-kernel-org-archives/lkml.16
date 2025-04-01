Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984637DA93
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522537; cv=fail; b=o17DvAuf2eVAqifoQpRVtBFNG/tc59VpibR7XeolGQU/BXf/bO4XJ5Cul2czNL0S/pXLoeeJSrJwE+9Vbk4fjAhOPzUVyCvXEhttO4T1+BD0KaYCbuRgds9d8tUHHHbIIiNitXZ5wtx077LWz8nTQZ9oPKbC43DMfQD19Fe5EIo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522537; c=relaxed/simple;
	bh=gqPiVdwTBUEZ5TcRPUL3d78twDD+RZc4ZivDsA7/rOM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EWsa7yLNTstvwgMUK95IOlL+JMQFfBcOYfxKzy1EbwGRjotDePz6MeD6FCrsK0C3q+7uYmH83LE0/xhf8YsNIc84RrldGESzw3qMNO6Pd1C7Hmt1zl0aSuRaU68cEMOSIW4G93zwuyWkw9vuJ1+Sr37frqQqfzhkBAQguzyeVOs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZB4XxlhL; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZB4XxlhL; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZB4XxlhL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZB4XxlhL"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ngSzfymkucHOmyFNk4PUKeALvIKHzcKHmcYe577sg95/FyV6T8rPxx96DnHDcZg08FPbVGV7W610077Ets49t6x58bbJs7tBKgIxkPMvlpfThfIHo7bupClY8/SoyHM2yFXxw6eWXBCNKRI8TjDq9zx0lyqtKyFZJ7T4MdRWwpqiTFy04FlRYgg0lOK1Hbcp8ktDY7IMYJm41y/Nr5Y++12nBdToizO4M0dUuXs2DHv6PaJwUFzHeIAgfZ3krQ+BPAOAUuMXOo+Z7hMZubojzAOxrGy8scfwLNZLeZOoj7qMF97r7nCpd2lnAPlFKfm2kEAqKEkhi8QD9+G3T8IOjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKToYnsnhK/atjtQcUyS+m3lGaKZADzK4Xhkt3mZuVo=;
 b=PoQUD+RTTPvyMnQXMD60GpLSxTMpE+8tuHE2Oc70wu+f0t01tZfszp+38lOtbY+P9iY5FT5kT5ODGo97ysMF+jAh2NK8HMTPw7Gl4Wp9nKzBo9DUYILnY1qbqvX5cALSInxE95WkKa4C0HXKTTom4mZeHTbWmPY0eclFvV4utf1ujrwRw+enSZOKTq+zjObEke8HdTwxXWkcoiR1APmNFdFaDv6Wf7AQmCu89v6plgbp61YmzJzDhulvcz9cLTGw+vKf3h7eoqgCMrFDjBbvPvxQPbEoB09qTHeghemwiJrquDKnajgCk0w3RjPuODxWB5ASbCj6Pe38lPp9/adn8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKToYnsnhK/atjtQcUyS+m3lGaKZADzK4Xhkt3mZuVo=;
 b=ZB4XxlhLBJzUytrgYqaEHiYB5nHTNaTFSoJ1iZh/P0dCn7o4B/4W7EWXOTr9tz/Sh7pkXFeT6GeM4Cqmj6eL0mLJfAB2eagtTFuVsHlaeCh+1DZwHaBlWCOZJTKaTgD2qwylGPn9OR+LwQWJCM03w/NAbCvGKFl/fNHlUbsjIps=
Received: from PA7P264CA0166.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::17)
 by DB4PR08MB9191.eurprd08.prod.outlook.com (2603:10a6:10:3fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:48 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:102:36f:cafe::4) by PA7P264CA0166.outlook.office365.com
 (2603:10a6:102:36f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 15:48:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 15:48:46 +0000
Received: ("Tessian outbound d933a9851b56:v604"); Tue, 01 Apr 2025 15:48:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3fdee01f070c5258
X-TessianGatewayMetadata: zdau7lNxuKT/PBcDwz3JCS2lj63ukJ2jrJIWxTaUjM4J6d/6vgGv2Uba6bRv7oVwjPrFR7AVbtJd2w2lXo0EC7ypRf38cXS0EBPE8gRernDiHiVlJ4Fv6w5eUk61eC8BtMmtjqw2Kz7GPm42uGpB0DedA5fQQA6MXUpJUpWUmae+F/l/q0nIP+VWkx+pkSzP3TzAnnKjhnU+Noi4B2eyuw==
X-CR-MTA-TID: 64aa7808
Received: from L12314321001d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A8011DF0-7E90-4AE2-B5FE-6DADAC91EE5E.1;
	Tue, 01 Apr 2025 15:48:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L12314321001d.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 01 Apr 2025 15:48:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSx1CPoRt16r07GY7pWLzthTJMdFmrhOJY53q3dMq4FHZahsLE8CoEey/1+bpyGDgEVMTdTnqPjegb/wT/XPXeUMyoywCEazb2t7wVJMvSfaO2inGYQ79K1IU6e+O4e1Q5Gy5KAjKlYj4eEZ+sGaXLxlQN7f//vJ/Nx71srbCNj7z+U2druhY/VUOk/+Su0IE+W/5y/yChHlwEvq7HhL1FwwD+Atj4JSVLoV2hTzwAw4A+UWh4M0csElGJUbSXAYNTBmfSzd563jETc1hNHj9tF+7L1Ow+nTeiXgX8zQQWJ+/wJg+uzXrFqIvlyvbxtHvlTNSIeqmY+KPk+WCZM6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKToYnsnhK/atjtQcUyS+m3lGaKZADzK4Xhkt3mZuVo=;
 b=IQJHJzMawE3owv7ibm8XZ5HwRvxl5ZHCzxPXJWWTvgk5o6v+ra7w319dnhnzfxG+JaiuolZ9Ps0qS5AgWzWDUH/xSl+OGMMj2lquNpaKRof+01mjMyoggF5Bzbd0v8y/FcJJ+oxnJ6IGxCypgbGQjY0CSQyGRCfn+C+SrRFS9RaiWDOukNXR3ZQycdW20Bsvt4QqLMrj6ZfF712POI3BTON0Xz9S83SwY7jWSrje8IzGVtdgzSd1UyvhVaK+TyIP3FuzJG9z0MfOoVY7yusTlrfUPvS6A5SJVxTKE2BGVIrBz3uh3FCpXZ9YiCHlK7jkm+aUWcDZMpd1bNmUIUNXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKToYnsnhK/atjtQcUyS+m3lGaKZADzK4Xhkt3mZuVo=;
 b=ZB4XxlhLBJzUytrgYqaEHiYB5nHTNaTFSoJ1iZh/P0dCn7o4B/4W7EWXOTr9tz/Sh7pkXFeT6GeM4Cqmj6eL0mLJfAB2eagtTFuVsHlaeCh+1DZwHaBlWCOZJTKaTgD2qwylGPn9OR+LwQWJCM03w/NAbCvGKFl/fNHlUbsjIps=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:38 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:48:38 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v3 2/7] drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
Date: Tue,  1 Apr 2025 16:48:17 +0100
Message-Id: <203e6c8f7e82068fd570896a4302757247980c09.1743517880.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1743517880.git.lukas.zapolskas@arm.com>
References: <cover.1743517880.git.lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::16) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3315:EE_|DU0PR08MB8279:EE_|AMS0EPF0000019B:EE_|DB4PR08MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: df9c3118-7195-4984-87a2-08dd7134b070
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?T25hd2lVMkV4dFcvNnU0eGZVd0Z3Tnc0UUxYelRCY2wxY2FPOEpkSVNETm91?=
 =?utf-8?B?NExsaGhmT0RtRXVqbXk0RDFGU2JjNVkvTDJ5L2laSTFicno2ZWwyeERPN2Vm?=
 =?utf-8?B?N1p4UWN0VzYybXdoSGUwZlpoS1BJMnB6ZEQ2RTdjWFBYNnZndjYxbW9XZjg4?=
 =?utf-8?B?NFZNYUEvZlpCajg5Y1BnYzZtUUxKVSsvREM1YmxrTU9lTlZGR2dqeTFPVGlL?=
 =?utf-8?B?L3NnNkJjd2tHVGp5dUtDc2UvampvVjRrNUFtWnVZRWMzOU5KUkpNd3JiVDVE?=
 =?utf-8?B?Qzh4d3RZcndkTTZJTVJJQ29zditwVzdrV1J5WUNyUVdkM201eldqd3AyRjEy?=
 =?utf-8?B?bE13c2Z5cGc4NW1rS1ZBZExVam96KzI3SGNseWJ5SEhGcW51cGNSeVROVGQx?=
 =?utf-8?B?ZmR0NW01OEFDRlk3cVErOUJFT25ETmNYUkl6RGozZkZuSXVubkhBVktqNC9Z?=
 =?utf-8?B?VlNiLzNqdS9HcTcvSDJaV1FWZjR2ZWJFOS8yODBVdnhYeUFlUWNIRWczQmJn?=
 =?utf-8?B?MW1ZMXhNS0JZbGpGTWJkSnhRYWQ4WGFDZnNGMlV0TVZIVDhKSHJvcU5MWVdP?=
 =?utf-8?B?KzlqcEgyZVNxS1RjT2ROSEZpUE8wRmtFMms5RXQ1aXlvWnZjSWNZVC9jVUUx?=
 =?utf-8?B?c0wrdXViZ0ZmckF3T1g2V2lrYjE1aGUvWGdsWTY1cXErNW1DN0RtUzRBbjcv?=
 =?utf-8?B?VHViQ0NxZXJXaFQyVTgzRU5pbmVZSkE4L0VXaU8rUzNqTmR0dUNHYzhBSDJs?=
 =?utf-8?B?VnpsbVZ5VWJPNmdNQzdIVmp1ZVZNZDkzVUpHUFpRRkNsWjZOZVJabFVaZlMw?=
 =?utf-8?B?ajR5a2JrVUtZNHVxRnRia3p0YmllMWJaZjhPbEt3NnhXamFaZXo1ZXN6SzVT?=
 =?utf-8?B?eHUxSFFNS0lwL0tiRmdscUhRK3hBeHVVdDhCWGgxcGIwUzJxNUNaVVluZXBU?=
 =?utf-8?B?UlVqNDM4eUhlQzArYUVQSDd3RnRJZWJwNjFLbDFERi9memxVTmNQQlpIdDdT?=
 =?utf-8?B?N3dvUlBzVVBFOVlPUFVrYVIzSE9RRytOZHdWRWxMM1BpVnNlLzRWYzNmdk1F?=
 =?utf-8?B?bllMMkdhVUdQbzhLQ0RDLzFIUitGQndEdWFoRUhVQmNObHNhTnB1VUhKVGFP?=
 =?utf-8?B?YXMxQUVDeHNPdFdKWXpCTnBBZjRrSGtORmUzNFM5YkdtY3FIMXZsRFBNQkxu?=
 =?utf-8?B?UEk5ZkJuM2IwWllGUGZYdjRrSkFmZG5TVmpjdzNMbS9IUEhZcy9HRHJwMWZr?=
 =?utf-8?B?a0RsLzNNRUVFV2FaR3MzcVE3cmNqeHZ3ZkFEdUdPc1ZiQ25ta0hzb1NQckFo?=
 =?utf-8?B?MCtBazFyczVyb1lyYXhrOHEyZ0lhTUhZSXJXUWdPUjRxRWxLYUtaVklnK3R3?=
 =?utf-8?B?NUZiaS9pTk90NDFicVdydkJUbzNqL2o2QjRWWmxnQ1dJNll4Nnd1WlJmM2I4?=
 =?utf-8?B?OC9ibmQxZzc1c0hGbHc3cWpVVnBiUjlvVzhseGEzS1NZSVVjaDI0S3I0L3lS?=
 =?utf-8?B?YXFtYnB5V1pYMlRIalpsYWwrSXlleXlsL2wzRFhJOWFtYkloUEFCTzZXbzBW?=
 =?utf-8?B?T2t4ajFVT2VXNyswYW5qcHFTbElzaWdzaUhDdG5PUnA3TWlsQzdTaktZT1Bu?=
 =?utf-8?B?UCtmYnh6UFBkb1B3T2owTU54cXptbDhpYm5WSVBVT3p3b2p0eHpWNWx2NEY3?=
 =?utf-8?B?K1M3R3ZPTUpSdTZ5ZWhOMDBDTk1IMndxbjJPeTc3SDlOMG1xQTkrQ0FrVW9w?=
 =?utf-8?B?T3RTWURwdVFMbzI0bE15T1JyVmN5dFBCMU9tMXhCTnFNbkF5Q1Q2ZW1NMU51?=
 =?utf-8?B?RjhnUlpVaWpWWWN5L1krUEcrQXVEbUtuVzFRUkVwV2lxL0ZXV3FwYWxGT3VV?=
 =?utf-8?B?NGhDb1poQy9TbEs1QjczZVgzdzlKNEd5cFdWWE1wbVVCSDJIdTZWVm0vb2FN?=
 =?utf-8?Q?+SEC48H7oXA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3315.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:208:5c::16];domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22075fad-1163-4046-218e-08dd7134ab1e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|35042699022|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dndBSHFjOXFHcWNiWTRodHFSRTUzOTFrOEh1ZFpISTNPMCtmNFRTUTdjTmRM?=
 =?utf-8?B?RzBRQXB2MmVWTzdYZ1BvandyamVDemhKYlRwbzZjK3k5UXZvTUFqU29aeDFM?=
 =?utf-8?B?U29MYndnVzM2Mjg3NWNaTmdZV2lXUzZ1WVFmREFjRlEvek9vdU1SaWtpcGJO?=
 =?utf-8?B?UkxpTzVMY0U4RjcveFVoeldMell6RTYwTmx1N01HS1FDdVhBNmVDcFFOQXZ0?=
 =?utf-8?B?WFVoVkhIWVR3NEpPMkNhMHovZWlvU3lBYTQ2eVVXWjNqZDRqRmdpK2J6Rmpr?=
 =?utf-8?B?cTlzbU1Ka2NKN2pqcVQzbjJ3MEpJU3RnWUVmR1ptWmhMcjVrV0lzUTFmcXVk?=
 =?utf-8?B?d3lySC9nbWJMVTBZblVyRmxNTmhSTWlkVWJCOVRNZjdwQTR3bnYxdVpYRkFm?=
 =?utf-8?B?L1BCWVYyVVJieC8zNkd0cG5kRVhINzFXZWRuYVBQUVU2U2ZIV0F2TXVjOFZH?=
 =?utf-8?B?aC92SG50dXdVODJYOUY0c1l0VkJFVEhuclJhZXFlaUtwbVBjbkRPOXNhSzdS?=
 =?utf-8?B?M0w2NlM5RktBdFBqK0F6dStQc1VnQTRSRWo3UDljVmxLNUx4QjEwL1RTckxs?=
 =?utf-8?B?Y2NsNG5vYnI0cDJydGlTZ3Zsa3BBMXBlbDAxSWg0dFRwMmtxQStxMEI2WmFz?=
 =?utf-8?B?YXRpdTBSYVNGN3RXaWxOTnY3OVFraGphcExzYzN4WlpwZm5PRzVIRFIyYThp?=
 =?utf-8?B?NHl1bjNiZXpueTVKUmo4U0xlZnJXMnJyQzFUK0VVSERqdVNrSm5OMGQ4VG9w?=
 =?utf-8?B?Ymg5bjNsaGxqak4vOHJ2V2VyeThPU3VwVGtldmxScmYwa3Urd1QvSWN4VUpF?=
 =?utf-8?B?TWMycFZGZlVwaWdoaFpSRXpwaFdIUDYzY2s5Q1I1Q1QvcDhvNzFZMUY0ZUxV?=
 =?utf-8?B?UUZMdWtzbTBQbzJaUzRBbWpkUnZyL2lFaEMrcHhGTVZKaDdwMWZjMnJCMzND?=
 =?utf-8?B?SEJhN21Xa0FxVUFyRzZMRWtHY0xJZjBrbUpaVnp0aVVXUEkzTCt1VHZUUlFE?=
 =?utf-8?B?TGFkR3VrK1BTelY2VHo3NjgzZERNR0dlbSs1ZVNqdGFaSzlhYXBrTkFKNVpP?=
 =?utf-8?B?VUtDem5ZTmF4eGRaTkVUK3AwV3RCOUF4NFNFT3NscDY2My8yb01qZHJkSGtr?=
 =?utf-8?B?OXlSa2dkN3N5NHd4Tkg3VW1mYlU2bXBlTUY4b3JOZTlCMTNVVTZPTjFJQnhU?=
 =?utf-8?B?U0JIcXN0K0xhK3hPVU9tb3dOMmIzYXl2enVMUVFGQXJzeStEb1lSdXhYUGFG?=
 =?utf-8?B?Ui9nMHd3eDFXd3BSRk9heDZ3VkhFNUpoMThOeHdsVUx4aVFmeU5PQTNZUk9P?=
 =?utf-8?B?ajJLSUJMSHFXcDgvZHpSVmlxNGRteis2dDVlRmJKZUxHUklSTS9ieXdleGlh?=
 =?utf-8?B?Rit5SnhVWCtyYjltNjFHOWdrTDhzQm5nQW9UZlEvZlNsblQzQUFUSnYzQ2Nm?=
 =?utf-8?B?ZEpBK3BNK3pMWWhJVzcwa1RUSUs5VWRPOWd1eUs0bTB4KzMvOUtLbU1jbG0y?=
 =?utf-8?B?QWdKeXZwS1dYZTJuZTdHdGIwTmIySWszTVBodWVYRzlxckVBbnNxbk9yYk9U?=
 =?utf-8?B?ZDhRSklRb0c5LzdqektwRFFqZnVFZG84L0RxL0JOcDdsTWVLdmhxZkxxdWFM?=
 =?utf-8?B?NTAyaExCL2tsNUw2Z0V3TWZhY3lnc3RnbUp2Z1lXM3hQbmprcU1sTmZhVkkr?=
 =?utf-8?B?WlpRbUF5T09VcWhKYXRPTWVCT0ZqOG41c2RZSGdDOU05VC80OWg1aVhMVncx?=
 =?utf-8?B?N2pNTm8xMXFNekhCZVEvUGE0aUhNWVZGZWpzWmdzbEtFWC9JL0piTzVVTC9s?=
 =?utf-8?B?RmhjZ1VNVzBITHNXb3hCZzZFckJvdGQxUW1obFhzVzBJM2RTY1o4MVdmUWUx?=
 =?utf-8?B?S1h2VkZZbVNPYkxEOGYxZkJVUVJFTXExUWZzMnVlYjlMaXYwR3lKaGxIb2tx?=
 =?utf-8?B?SzFjM0kvak51N2o2M2VFTm1DeHlFVkx5dWZnQ2pBdHR4c05RR3BLcTltR08v?=
 =?utf-8?Q?gzdZfS7s570knEwKRhqd8mkNWuP47Q=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(35042699022)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:48:46.8256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df9c3118-7195-4984-87a2-08dd7134b070
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9191

This change adds the IOCTL to query data about the performance counter
setup. Some of this data was available via previous DEV_QUERY calls,
for instance for GPU info, but exposing it via PERF_INFO
minimizes the overhead of creating a single session to just the one
aggregate IOCTL.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/Makefile         |  1 +
 drivers/gpu/drm/panthor/panthor_device.c |  5 +++
 drivers/gpu/drm/panthor/panthor_device.h |  3 ++
 drivers/gpu/drm/panthor/panthor_drv.c    | 10 ++++-
 drivers/gpu/drm/panthor/panthor_fw.h     |  3 ++
 drivers/gpu/drm/panthor/panthor_perf.c   | 55 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   | 15 +++++++
 include/uapi/drm/panthor_drm.h           |  1 +
 8 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..0df9947f3575 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -9,6 +9,7 @@ panthor-y := \
 	panthor_gpu.o \
 	panthor_heap.o \
 	panthor_mmu.o \
+	panthor_perf.o \
 	panthor_sched.o
 
 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index a9da1d1eeb70..76b4cf3dc391 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -19,6 +19,7 @@
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -259,6 +260,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_unplug_fw;
 
+	ret = panthor_perf_init(ptdev);
+	if (ret)
+		goto err_unplug_fw;
+
 	/* ~3 frames */
 	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
 	pm_runtime_use_autosuspend(ptdev->base.dev);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..657ccc39568c 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -120,6 +120,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;
 
+	/** @perf_info: Performance counter interface information. */
+	struct drm_panthor_perf_info perf_info;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e32073..9d2b716cca45 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -835,6 +836,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 			args->size = sizeof(priorities_info);
 			return 0;
 
+		case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
+			args->size = sizeof(ptdev->perf_info);
+			return 0;
+
 		default:
 			return -EINVAL;
 		}
@@ -859,6 +864,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 		panthor_query_group_priorities_info(file, &priorities_info);
 		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
 
+	case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
+		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perf_info);
+
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 6598d96c6d2a..8bcb933fa790 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -197,8 +197,11 @@ struct panthor_fw_global_control_iface {
 	u32 output_va;
 	u32 group_num;
 	u32 group_stride;
+#define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
 	u32 perfcnt_size;
 	u32 instr_features;
+#define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
+	u32 perfcnt_features;
 };
 
 struct panthor_fw_global_input_iface {
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
new file mode 100644
index 000000000000..b0a6f3fca8a9
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2023 Collabora Ltd */
+/* Copyright 2025 Arm ltd. */
+
+#include <linux/bitops.h>
+#include <drm/panthor_drm.h>
+
+#include "panthor_device.h"
+#include "panthor_fw.h"
+#include "panthor_perf.h"
+
+/**
+ * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
+ * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
+ * which indicates the same information.
+ */
+#define PANTHOR_PERF_COUNTERS_PER_BLOCK (64)
+
+static void panthor_perf_info_init(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
+
+	if (PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features))
+		perf_info->flags |= DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT;
+
+	perf_info->counters_per_block = PANTHOR_PERF_COUNTERS_PER_BLOCK;
+
+	perf_info->sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
+	perf_info->block_header_size = sizeof(struct drm_panthor_perf_block_header);
+
+	if (GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size))
+		perf_info->fw_blocks = 1;
+
+	perf_info->cshw_blocks = 1;
+	perf_info->tiler_blocks = 1;
+	perf_info->memsys_blocks = DRM_PANTHOR_L2_SLICES(ptdev->gpu_info.mem_features);
+	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
+}
+
+/**
+ * panthor_perf_init - Initialize the performance counter subsystem.
+ * @ptdev: Panthor device
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_init(struct panthor_device *ptdev)
+{
+	if (!ptdev)
+		return -EINVAL;
+
+	panthor_perf_info_init(ptdev);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
new file mode 100644
index 000000000000..3c32c24c164c
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 Collabora Ltd */
+/* Copyright 2025 Arm ltd. */
+
+#ifndef __PANTHOR_PERF_H__
+#define __PANTHOR_PERF_H__
+
+#include <linux/types.h>
+
+struct panthor_device;
+
+int panthor_perf_init(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_PERF_H__ */
+
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index c63cbdddde76..4d352008dffa 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -270,6 +270,7 @@ struct drm_panthor_gpu_info {
 
 	/** @mem_features: Memory features. */
 	__u32 mem_features;
+#define DRM_PANTHOR_L2_SLICES(x)		((((x) >> 8) & 0xf) + 1)
 
 	/** @mmu_features: MMU features. */
 	__u32 mmu_features;
-- 
2.33.0.dirty

