Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08CC212B2B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.83
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221334; cv=fail; b=WjjJSl0+fxxv72RY+lPeYwoMrvARJTxhZS1G9PIXrTsV6NIOR4asAf1JY39BZMhIhYMZk056CBq47RZrHX1qYa/8t6XhheO0rQpWhHuMxxvv2+r8a1vmaq7iatV73Htq8gNKBCfE5TP6Y9jCyJ6YDcij+cFb2QaBdm7eXTmTdbE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221334; c=relaxed/simple;
	bh=TocZ6OK+XxE0gdteD7EGQDopX3PnBjbT4cnz74cgJ7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bmE9J1LKNtQb8Gbk/IIrfZdRcbMzMNI5fUOvZK2cbEd5H2hK38EEiRgKRQsfYrUmaDG/ii7ZmI8hmMM+BoWu3UkfBmBT8A1JlTNUBALqBc9iowzLVQFRV2gms7VFsREIHU+2Q0u1jWn0JCLn8dU2kc7aIVFL3oHfhItlzeNbPYQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GNUAq2MQ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GNUAq2MQ; arc=fail smtp.client-ip=40.107.20.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GNUAq2MQ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GNUAq2MQ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pmMgZVoME4NBrJcdAywuTK74QWbwUJLKlp9b8IAQyUrwu9PN9G2kv32riFpz5ZC2CFuKIe4yzspTNJJLcjy/VLKGF/JAf1lAefVYaMselWn01wuaHgbgsCm6DoJrw1gEXDJysAv8zpnji5PEllqZVVbqScjklLHJiMAjKoDzDY9fWizFsAfTtSAb+QVqzwiXspEhSB3q0BhLDgixVu4ObKL1ElwqBe4rosD5M80fhzpYpvV4wAN+QWwfR5hWHGGQu0PezmB5P1KFoHw8OxfNvY54uQUsAom6S35riFoiyr6Pdq9IAFAeB6edmNZt1SCiho6/V2HDxjhUETywRcKQKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdkadukVhKosxOgplz05ETJV3GQsNBcbui5ztrZrCIg=;
 b=WEEjlnfFRbZDdA7jzBKh3TcQdyFroacnK+FJ5ZRDE3zLjSvE5NTu/qs9pRNU2pgzfDwfhNYHGUdlf2rlvVaPLlCg8DFmBo3jSLZsYv4sOxjTxMYDg7nvpAwnhCDzkBYf4vUP5zHzXnVBk6v7QsjOC5+ojajqIocDM1tTLXCR1I4JmYfqp465M6QT4SpXz0SWcW6J7bWvFh7K67+xwYwE+Vxf/cf+LBWWQcRhLogLBvr34bnHZZmoXztRAgw5glcwg7G8Mwzdzx/CM5f/oAY4wCi4aYjyvYMBUAscadZxDKdAA+yfNKTeFcebx921swozNmh/0FY4sZtrfUvDaXsB/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdkadukVhKosxOgplz05ETJV3GQsNBcbui5ztrZrCIg=;
 b=GNUAq2MQH4KvAFSbinJm5vGI1xsyA0Ckkdt1xQyWXuikRS5UBjWkYTF/mW3u/8JPHUjdedkmH0LETq9q4fa4RCgLHfrKSVcf30e4UH6Hr4n9nen2qGygbA4J+OnNW8Em7h/Hm3Sbga0+SAgIr4D13YJhWPGFufM2yjX5H+5NU2A=
Received: from DU7P189CA0005.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::8) by
 DBBPR08MB10602.eurprd08.prod.outlook.com (2603:10a6:10:52c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 11:15:21 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::1) by DU7P189CA0005.outlook.office365.com
 (2603:10a6:10:552::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Wed,
 14 May 2025 11:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via
 Frontend Transport; Wed, 14 May 2025 11:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPziqCeCbyE/Tu0DD5oYv/soE09tdrXd87yt931Kuaq5I0WglxX33OhfdQxfVa2lJGH+SndfntsHORCyd4TsY24I+u4OqhMwdZgvWGh4diNVU+zPJjhpGxMc6oRzms/bT5FEzaGI2+xtz5GgLsJifirB7nd/CXjp8enebflgn9IzPPKeJNEiHpq4zuZXT+reo3xPXxRU0shqFpLSzgcdrLL6HCV//49FANBWpHuzCyZofLhsmWNb7s5VpMVivnAQYkAV+2S7GQp0A/siQEx7NjYYOVqSDK+V1LkPgrA03jICcxm0isCw+bWWlhFKIHtY0vgcXd4yBRD5eP493hheVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdkadukVhKosxOgplz05ETJV3GQsNBcbui5ztrZrCIg=;
 b=v0JcMmfU6KSvzlA81EFTfLOVDz9v9Vi4QKJKAv2OFJ68U8v6o1jwSd7+tlv+5PjrHo3O0E9sb1tI2fzplzGcXBlQI9st+CtbfCs+k7y02qDCbjXQu9/2lPlpWUePZUw+FCQwVdoPyy5xdv/p5jgPTeRLWLCqmOmz37znRSG79VUZSbO6Jyo0KTK16lEB8TFkystWf3MGAz7WfnjoFykwiWMWsCt6eG7GTjgTzcDGnJCcUaOu5EZvOu0PrA3pEb9D2pDZ/Co+8GZkBGtMjIUsxDHohgoP4hmSrwzaqmkyg8uLwYG6XMTbO6wO/EiwO+5TSlWZYQrnX2YNyB7J2nnKuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdkadukVhKosxOgplz05ETJV3GQsNBcbui5ztrZrCIg=;
 b=GNUAq2MQH4KvAFSbinJm5vGI1xsyA0Ckkdt1xQyWXuikRS5UBjWkYTF/mW3u/8JPHUjdedkmH0LETq9q4fa4RCgLHfrKSVcf30e4UH6Hr4n9nen2qGygbA4J+OnNW8Em7h/Hm3Sbga0+SAgIr4D13YJhWPGFufM2yjX5H+5NU2A=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV2PR08MB8272.eurprd08.prod.outlook.com
 (2603:10a6:150:b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 11:14:49 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 11:14:49 +0000
Date: Wed, 14 May 2025 12:14:46 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <aCR7Jr0RCWvqb0iM@e129823.arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
 <20250513170622.3071637-3-yeoreum.yun@arm.com>
 <20250513170622.3071637-4-yeoreum.yun@arm.com>
 <20250514093019.GE26114@e132581.arm.com>
 <20250514093900.GF26114@e132581.arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514093900.GF26114@e132581.arm.com>
X-ClientProxiedBy: LO0P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::6) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|GV2PR08MB8272:EE_|DU2PEPF0001E9C0:EE_|DBBPR08MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: de8ebe52-7460-4002-ca2b-08dd92d89d77
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?rcDpfP5Flj/22W70igQMGADix4y6Rq24uXxmnkRcNjwA+RGWlIMgvNX2SnGp?=
 =?us-ascii?Q?xtcqwBWK0iPPF8AZhX3GHa+jw9HeKvHnoD28MuA2BdW1LdGA1kQWQ4iHOUij?=
 =?us-ascii?Q?xz/9d1DcMzsCxAGhWQ2EFPNagy0NXlmCPQogQ3b6L4bdRRmVN039LSa9le3X?=
 =?us-ascii?Q?23iR+5lnGxpwY4M/Bpg3Ktrlef9kFWT0x+KPJk3lnmws405Axf/FBsFOC+Or?=
 =?us-ascii?Q?BI9S8W3I/rpGZ/cOIv3wqLYgT7S4ElroyAsYJAvaI4SQdk/YTqfVub/Sjusb?=
 =?us-ascii?Q?Cs7UF1CvU/43xSEo2MofTPzeu1m9pJ+u79g2t5HlK8ONVOnbNnv3phObV22f?=
 =?us-ascii?Q?24yfwMfJ5PQTC+5eWPk+qHILl0fx84cGe1GVSvbB+kVyJMTUb1g3WeDIminz?=
 =?us-ascii?Q?UOcWR40st/LyNxkUqWhEeXaur1ojCYT7QFgajNGEFkcvp2w0CXEOSg5NlE3n?=
 =?us-ascii?Q?ggTLsbNaU2YX2Ccb39/kU2gsgioqn3xf5nKG+qYhDaIV57LnSsF34evu4I9M?=
 =?us-ascii?Q?nzSd96oNd5tkTbIIvAJc/WgorYQejtgv/YniRu7pwZlV+se7WbmoZBqH3YT4?=
 =?us-ascii?Q?At2KgkyRcUR+gLQzJgAo/fQc5NkQN0L8B1WlsW2ezfBQ/LRr2EgYLT/B8OiN?=
 =?us-ascii?Q?4sOHKVcIAe2smULLNl6NGTz/pSDmuK6CW3RSS/Du3fwJxaPqOx403pmOOJb9?=
 =?us-ascii?Q?i9uZx6XaeKFHm/T/rtpUBwD9GLf+7LynJgEE30feNalb3W4eIVXJ6rOp9v7g?=
 =?us-ascii?Q?jjfHdfeJV6lCOAPm9gQ9xBFlvPWRLiT047omc0oXEGPxvqRtjigoi495kqW2?=
 =?us-ascii?Q?lsFv3iNCpqXBp9gxyKjvBzQjly9/iP+oKdygqU5syhxFPPi/tu32z2nS8zyn?=
 =?us-ascii?Q?bKT+H5l2bVCOqb1ejZyLI4EOrrmiZ9TTyccAb0mEk8y1FZPylABhD+WXgRBw?=
 =?us-ascii?Q?3ec+ln0SPX401V7f1u902cY8i/2rP95xkMs0IbhOLdSbpFTUahHhxYs7vW6i?=
 =?us-ascii?Q?iWCps4F+1ZgabqL+44v1wOme/ta4HVPiWihyS7Z6NFR3nzB/TP7FTK6xBu7E?=
 =?us-ascii?Q?JxJuAAudn+f3jKh0fRmoqBjqf/37YVWAOmz4ksD+Zq7DT9XNfc8UCbmdaOOZ?=
 =?us-ascii?Q?8Gm4fxMj92y4Z4sXg6b5LnOi3Ust0hCKoiIpJDbRrkjSGh3GkKtfDUubPcbJ?=
 =?us-ascii?Q?3Q3CdpseYCmpmuxLJzGBTjwdpodqdYGr2DB+An9DjDGeiplobrcZX7qyyPYS?=
 =?us-ascii?Q?PafSm89z1PvFOUbQRCHEV/gB10gURRlMczPIaGlOeWwr4p5j6fH3/Hvtgt2a?=
 =?us-ascii?Q?yen6wbMaorpiznPolnyg9MHZTvYiBn8X5zvYu5j1JZdDPTO4SIipVa0fk69R?=
 =?us-ascii?Q?oEQImMjs4rNT5+zPJPeUwiTKHqWemQFvuZsH/TW0rQhI0eb5kg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8272
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0dbf9bb7-6ace-49f3-cc9a-08dd92d88a6f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|35042699022|14060799003|1800799024|4022899009|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5UrCyCszf5uC22W6wG7LvusyexIr9ZdaXxTP4m0WPdfNTbRkRpNZgt2dV1RS?=
 =?us-ascii?Q?u2KDD2++Dd8LQhQ2UmwPob7d3UeRcDTRX7ILHOAEFKG3pgPnaIVZa0vEeuBg?=
 =?us-ascii?Q?77ZIDrPWeIUS8E1dKohLVWe6ebKZzmn54R7B1Z884g7Ub86D5lU8y8GVJvbA?=
 =?us-ascii?Q?yYkCZ3uRYTTVbhG03oA3aFM56zNGbkyJEOvCQmweJ2nlCXlRkgTiP0eKSCNP?=
 =?us-ascii?Q?KzHAakMPmkM0q2k//N1AHwGgP2QwtehkwZQfUIq54amaXF4LmbZ4BghlCo7C?=
 =?us-ascii?Q?uLRl4o8Xxv+F07M4Ucz+RH0PYEktyniurELeHI0qOaacQhI+j0xECw/O7v2p?=
 =?us-ascii?Q?srxTreyF0l5cyzzZCqjfU1Ukz5t2qZYxajwTgaAIolorIr2THuI9RUlOIWdW?=
 =?us-ascii?Q?nteBlBscJYuEihVmrbugTmlRw2MuDcM/5CX8caJQtn6Ka4KQK0XD8eobPcq8?=
 =?us-ascii?Q?kZtRo66ik/dCiZ2nIsY2tv3OU3wsLOsPUFc30RcFzsU5nF4DoediN61ZEVGT?=
 =?us-ascii?Q?v2EBBguFV6C+rMNQCyQRM5wD3rEp7QQCLNAvA2fUdqpqsBSEYnUIoq+gYCTa?=
 =?us-ascii?Q?UtOZuipKiOIQndm2pQ/7Bu1/Ln0UOLuFOyMDUtz8NjRgN0qwp0Xb9QZRfl1p?=
 =?us-ascii?Q?AJofuBDtiZg5EZtgp3D9De7g3AN5yzPBNDqM+D1xuk3aEbDoMTaYvjVrksKI?=
 =?us-ascii?Q?6hlD/eFp1xeg307klLdYRCaEMCohr3X1G6Y2t5JVOtr6ohV5qWyg8NBXz71f?=
 =?us-ascii?Q?9Mn8SOfVQWC4njd6kM3Tm3JX//CotopN/Pvs6PvTDMrf4jXA2vwZqgK8YCMc?=
 =?us-ascii?Q?ByMTQN+ZCBWoR+KchbKAIec0HXVZqnIXpHIlt+23cBu9e86i6yBbfCBVFHIx?=
 =?us-ascii?Q?hATjuIDB0cFKd8qU+Bws66SYEHZQUWdypRRtRyGGkXtRtfOo8bLxNESYOwAF?=
 =?us-ascii?Q?Z1ji2Blol6gfB9YXFl6JPAxKIkJ5driNIYJnFPSwpHnPmHxUnqDN4wLt7bT3?=
 =?us-ascii?Q?Qpr7wXGDwHTlSiVgVHBZeF1DEInON6HCXE5t+HnalskM05k6LLa4i/o0lJvV?=
 =?us-ascii?Q?9TukPT7eg9m7WYWRhpzLNv+OMvCbgOwA1sROP6xH5gBJjbwsBjJeP8HvdQtG?=
 =?us-ascii?Q?5HHVPNA4rc2W2dSicN9okE2sfBg7lJXZe9DemhfFlZKho9FFYwAWqISW9A+8?=
 =?us-ascii?Q?HzgTcnGCOH0mAbRAgVyJM/M8naHwx2dIXrDfXYkUvR3dCTcqGNlRgFjyGjLg?=
 =?us-ascii?Q?Oo5QddnMCzu/VFTExNJv10OgL2WpuSWky9pSV04XS4BgvqH7GSitX3Fjqa0Y?=
 =?us-ascii?Q?4YvM3sve80GvPGIJLvbLlF3CT4C/qLadLq+1oY2Ad9ccGF8chTrmMwM+UbWT?=
 =?us-ascii?Q?ELPJqjUSVSo77NG2l3lrcxcpBvU4hFU/fikRIn10E4bm4j7SrNqqMeyWLfl8?=
 =?us-ascii?Q?79efy5FOrn/+CGsirKPyT/H4F6llrEFg6FuJQEU1hRsbZSMRxVyNE0bKt7ao?=
 =?us-ascii?Q?AulvoRIBzKL4uKeEWh6CeK0mpdPO9FFypW4V?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(14060799003)(1800799024)(4022899009)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 11:15:20.7866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de8ebe52-7460-4002-ca2b-08dd92d89d77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10602

Hi Leo,

> On Wed, May 14, 2025 at 10:30:19AM +0100, Leo Yan wrote:
> > On Tue, May 13, 2025 at 06:06:22PM +0100, Yeoreum Yun wrote:
> > > While enable active config via cscfg_csdev_enable_active_config(),
> > > active config could be deactivated via configfs' sysfs interface.
> > > This could make UAF issue in below scenario:
> > >
> > > CPU0                                          CPU1
> > > (sysfs enable)                                load module
> > >                                               cscfg_load_config_sets()
> > >                                               activate config. // sysfs
> > >                                               (sys_active_cnt == 1)
> > > ...
> > > cscfg_csdev_enable_active_config()
> > > lock(csdev->cscfg_csdev_lock)
> > > // here load config activate by CPU1
> > > unlock(csdev->cscfg_csdev_lock)
> > >
> > >                                               deactivate config // sysfs
> > >                                               (sys_activec_cnt == 0)
> > >                                               cscfg_unload_config_sets()
> > >                                               unload module
> > >
> > > // access to config_desc which freed
> > > // while unloading module.
> > > cscfg_csdev_enable_config
> > >
> > > To address this, use cscfg_config_desc's active_cnt as a reference count
> > >  which will be holded when
> > >     - activate the config.
> > >     - enable the activated config.
> > > and put the module reference when config_active_cnt == 0.
> > >
> > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>
> And please add a fix tag:
>
> Fixes: f8cce2ff3c04 ("coresight: syscfg: Add API to activate and enable configurations")

Sorry to annoying you. Thanks ;)

>
> > > ---
> > >  .../hwtracing/coresight/coresight-config.h    |  2 +-
> > >  .../hwtracing/coresight/coresight-syscfg.c    | 49 +++++++++++++------
> > >  2 files changed, 35 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> > > index b9ebc9fcfb7f..90fd937d3bd8 100644
> > > --- a/drivers/hwtracing/coresight/coresight-config.h
> > > +++ b/drivers/hwtracing/coresight/coresight-config.h
> > > @@ -228,7 +228,7 @@ struct cscfg_feature_csdev {
> > >   * @feats_csdev:references to the device features to enable.
> > >   */
> > >  struct cscfg_config_csdev {
> > > -	const struct cscfg_config_desc *config_desc;
> > > +	struct cscfg_config_desc *config_desc;
> > >  	struct coresight_device *csdev;
> > >  	bool enabled;
> > >  	struct list_head node;
> > > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > > index 5d194b9269f5..6d8c212ad434 100644
> > > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > > @@ -870,6 +870,25 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
> > >  }
> > >  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
> > >
> > > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc)
> >
> > I would like to change the return type to int, so the error is handled
> > within the function.  As a result, the caller _cscfg_activate_config()
> > does not need to explicitly return an error value.
> >
> > Otherwise, the patch looks good to me.
> >
> > Thanks,
> > Leo
> >
> > > +{
> > > +	if (!atomic_fetch_inc(&config_desc->active_cnt)) {
> > > +		/* must ensure that config cannot be unloaded in use */
> > > +		if (unlikely(cscfg_owner_get(config_desc->load_owner))) {
> > > +			atomic_dec(&config_desc->active_cnt);
> > > +			return false;
> > > +		}
> > > +	}
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static void cscfg_config_desc_put(struct cscfg_config_desc *config_desc)
> > > +{
> > > +	if (!atomic_dec_return(&config_desc->active_cnt))
> > > +		cscfg_owner_put(config_desc->load_owner);
> > > +}
> > > +
> > >  /*
> > >   * This activate configuration for either perf or sysfs. Perf can have multiple
> > >   * active configs, selected per event, sysfs is limited to one.
> > > @@ -893,22 +912,17 @@ static int _cscfg_activate_config(unsigned long cfg_hash)
> > >  			if (config_desc->available == false)
> > >  				return -EBUSY;
> > >
> > > -			/* must ensure that config cannot be unloaded in use */
> > > -			err = cscfg_owner_get(config_desc->load_owner);
> > > -			if (err)
> > > +			if (!cscfg_config_desc_get(config_desc)) {
> > > +				err = -EINVAL;
> > >  				break;
> > > +			}
> > > +
> > >  			/*
> > >  			 * increment the global active count - control changes to
> > >  			 * active configurations
> > >  			 */
> > >  			atomic_inc(&cscfg_mgr->sys_active_cnt);
> > >
> > > -			/*
> > > -			 * mark the descriptor as active so enable config on a
> > > -			 * device instance will use it
> > > -			 */
> > > -			atomic_inc(&config_desc->active_cnt);
> > > -
> > >  			err = 0;
> > >  			dev_dbg(cscfg_device(), "Activate config %s.\n", config_desc->name);
> > >  			break;
> > > @@ -923,9 +937,8 @@ static void _cscfg_deactivate_config(unsigned long cfg_hash)
> > >
> > >  	list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
> > >  		if ((unsigned long)config_desc->event_ea->var == cfg_hash) {
> > > -			atomic_dec(&config_desc->active_cnt);
> > >  			atomic_dec(&cscfg_mgr->sys_active_cnt);
> > > -			cscfg_owner_put(config_desc->load_owner);
> > > +			cscfg_config_desc_put(config_desc);
> > >  			dev_dbg(cscfg_device(), "Deactivate config %s.\n", config_desc->name);
> > >  			break;
> > >  		}
> > > @@ -1050,7 +1063,7 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> > >  				     unsigned long cfg_hash, int preset)
> > >  {
> > >  	struct cscfg_config_csdev *config_csdev_active = NULL, *config_csdev_item;
> > > -	const struct cscfg_config_desc *config_desc;
> > > +	struct cscfg_config_desc *config_desc;
> > >  	unsigned long flags;
> > >  	int err = 0;
> > >
> > > @@ -1065,8 +1078,8 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> > >  	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> > >  	list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
> > >  		config_desc = config_csdev_item->config_desc;
> > > -		if ((atomic_read(&config_desc->active_cnt)) &&
> > > -		    ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
> > > +		if (((unsigned long)config_desc->event_ea->var == cfg_hash) &&
> > > +				cscfg_config_desc_get(config_desc)) {
> > >  			config_csdev_active = config_csdev_item;
> > >  			csdev->active_cscfg_ctxt = (void *)config_csdev_active;
> > >  			break;
> > > @@ -1100,7 +1113,11 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> > >  				err = -EBUSY;
> > >  			raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> > >  		}
> > > +
> > > +		if (err)
> > > +			cscfg_config_desc_put(config_desc);
> > >  	}
> > > +
> > >  	return err;
> > >  }
> > >  EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
> > > @@ -1139,8 +1156,10 @@ void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
> > >  	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
> > >
> > >  	/* true if there was an enabled active config */
> > > -	if (config_csdev)
> > > +	if (config_csdev) {
> > >  		cscfg_csdev_disable_config(config_csdev);
> > > +		cscfg_config_desc_put(config_csdev->config_desc);
> > > +	}
> > >  }
> > >  EXPORT_SYMBOL_GPL(cscfg_csdev_disable_active_config);
> > >
> > > --
> > > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> > >
> > _______________________________________________
> > CoreSight mailing list -- coresight@lists.linaro.org
> > To unsubscribe send an email to coresight-leave@lists.linaro.org

--
Sincerely,
Yeoreum Yun
