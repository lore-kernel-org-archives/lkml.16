Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F59272E47;
	Tue,  6 May 2025 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528607; cv=fail; b=ia3BzpIAZui+A7kMGxq8KXr8AWTL/k2AF9Z/jVB0xYTwC++XKefza91HPZ8w0TouLRAp/sFLqBvN2Q+0bljdQ+6tjgJv1d8DoLbmrmT1jxWaOFqdYNkZ6KhDD97sx32uoeR3OZTXKCS+T9yHZZaYYx48if2FKtQoAtM8Ny+ONdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528607; c=relaxed/simple;
	bh=6beNn7cgWQfut0xgH1gplizIJas5jbSrMVJUWVVktmw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lcw4Kopoe+Nl2e6DxsanpVJr7nRJh/6isGiLRxdpKRBjXLHLV9Jyp9k1tUvxS0icxYTVNQezQhf3+HS4cvjJO7ieX4ZMT6XfnP3sgp46lCGz+W8iMmkEMk2hTY2YRU2hXKl08N+QUdL59eRGA1tUUe/aHnJvaR0Ku/hTW0URA0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cZ1Yn5k0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BSxcyaOX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cZ1Yn5k0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BSxcyaOX"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546AlDKX018309;
	Tue, 6 May 2025 10:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pQysJPA0hFNtgBsLg3sT0B1x+/DgDJoWRMwy66z2Wuo=; b=
	cZ1Yn5k0MPpoawOSgiWz7W0PPMcwjlV2JVjJLfs8DjKcC3w+Tweu34AFPyDAD/4N
	oY43TSKlFvsUkQab4hZ0KizVa/v5dSWdaMP1wKJD/7R5kI19iyAqqdCMgREsBPtn
	1mQcFAvN3FWmHhC+mavltBHJVzqncJtgpc/gfzfs2MO/3/piDhWTHrmEjeobO79E
	od8BOvP8fdqbZsYX5TdRy9fSjimsZ41wUjX6idbBzWnsZWD/g51JBUijlfSP98ww
	ClFsisDmCCDwb/Y9C885zFHxaHt4rrsq8rKDXAKzRkwsTiWBnnfa1T8OxAAbGbcS
	1f9tssl5iUL1EDvMzmNOrA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fgykr0aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 10:49:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5469gvFu035282;
	Tue, 6 May 2025 10:49:44 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010007.outbound.protection.outlook.com [40.93.10.7])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k8umbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 10:49:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHbJkri+9d+pzx2JaDrOmIncHfoR0dVztQZrwT+e9pzAeauOqYzt161B/ICZbBhP7OpHAttLm8HU9KRFWReJQeV6l0gwQZtAf+6YJFcBkskHagNL0eZrLPYt8HykcpoWFINN+jfYuJg0CLuPrb/x9gYi5ZMXPHtrrOqr1EOYOXEg4MYcnocu98mJkqh/m2vEZ4KscNzFUpBxuo/akjVtj4hgyxakmjpA58RtLp9s8kOWLrMUFLK7ZLd5bHkRK0MU9m/bihNlERbYHtnPZu+dcj0WKb/mrJ3KsHxq/E+OT8oxTNhQfl9mi+bNsnEkGRU1yp1DeEClfvVKWyQ2J9V6NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQysJPA0hFNtgBsLg3sT0B1x+/DgDJoWRMwy66z2Wuo=;
 b=kOC/KcfzqWcP1dAr8WHcezXk5W4xnzRXMcvQexOO5Mu03ZUePrpNJavRUrOfs2r9uJZDotxQJv6rGWPi6yU7d9J3LXeyqtCPpOJFIzGb8p7IZocz/muGgGQLO5oouWs3nWZGIS2PvOmS1xgGm++wIKESxyDMhKV8Gfr/QcVSztYMQRAW/ZZgWKg0FBmCljsa2tBMr5H1lbvWzDUZF90jys3PWQQUjnk1Bf66NbLgpAFoFqcqyf7ojKTDYRR57fqUoha3A98bnrRLe5GB6xEXVRFxLFUsTwgi/aWRpJlnRUYmgxY/Q9eWxewyrB1LZfl8+96f65uIaXRSw1NFPJu5mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQysJPA0hFNtgBsLg3sT0B1x+/DgDJoWRMwy66z2Wuo=;
 b=BSxcyaOXp0bPhfteTSQGMFjR6XsAv528qA+22O0I1qGoOrdPm+5mxKvOiegf0+7Fn6OhYy1l62XuzjBgoTFUbcDLAfFYqyDQk4vKjnvO+g+TB0TMzKH8FO4Hti+4n9oh2NJ8sXMApeWoohVYJ5PxWK2GBv1fbyIUZbfUMze6s9I=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SJ0PR10MB4510.namprd10.prod.outlook.com (2603:10b6:a03:2d6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 10:49:38 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 10:49:38 +0000
Message-ID: <b23a54c9-ca99-4db9-a105-c0f3c000850d@oracle.com>
Date: Tue, 6 May 2025 16:19:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] platform/x86: Add lenovo-wmi-* driver
 Documentation
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
        Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
        Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
        Mia Shao <shaohz1@lenovo.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        "Cody T . -H . Chiu" <codyit@gmail.com>,
        John Martens <johnfanv2@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
References: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
 <20250505010659.1450984-2-derekjohn.clark@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250505010659.1450984-2-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:404:a6::21) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SJ0PR10MB4510:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e630fad-51f4-46d7-6812-08dd8c8bb27a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGNWTk43N0k3T0dnTndGTVYxMHdoN2lIZGpPRlo2N3VERkpuMXZ3ZWEzUHNw?=
 =?utf-8?B?NkN4WHRsWGRLbkp1M0RvK1J5RmdIRXNDdHRsbGhreWFtTHhlSkRuMW9JY1pn?=
 =?utf-8?B?MGJ0QndDZSs4MVdwS0RWTTlVeDlBTFZISUl3a2wzaHMyR3VoemUydkhkeVZK?=
 =?utf-8?B?YUp5UHFIVDJEcDgreEpFK2FoNm5JejBwWTRDSGFjdjRlVFhFazJST0NZYVdW?=
 =?utf-8?B?bkJYYUY0bGRBdVJWWFVIZzZsVU16SURBMXdEd1NaN0RvWHRGV09zYWxxbGp3?=
 =?utf-8?B?WTRCZVA2bks0ZEs3aGJtZkxWTnZZMTFxQk1qTWlyWUlXcGFPZlpNdm5sbERp?=
 =?utf-8?B?TlByeFlkUXJNY3JvdUdQb0VDbiswTFNuV2krMWJZNzZteDhGamJTUHhnb0Qx?=
 =?utf-8?B?L1VtUEp1N0VQSWVsYkozSnpSZzU5ZEViRkt2cERKd1VtWVFMbDlzSUtxdGV0?=
 =?utf-8?B?eDVCMVFkbGk4NEs4SXdPQ1BSS2tLSGszNWk0YnJkYUJ5ZnVQa3VBdFFVeVlH?=
 =?utf-8?B?TWhJckdDSm5tSS9HbloyVmJyaEdzMGxKOEpVcEVpTng4ZGx2SDdBL3N4Q1Va?=
 =?utf-8?B?Vno4dysrN1FNbTRHcUxhN0FKRzdIUVhDaEU5NnVoaGdkZmdzbncrbDF1ejJ1?=
 =?utf-8?B?bWZaUi84WFFhMTFPOFI3Z2FUTDIyYi84YkJlOG8zc0xOZXA3VW5rZG5nc2JD?=
 =?utf-8?B?UnlKa3hDSnJVd2toeVV0NTdWY3NGZElKUW15b1A0RkNLUEttZ2dySGM1UXNP?=
 =?utf-8?B?K0pmY3EvUzNYY2NPRHJYRVRSdnVuenhYWmh3R1Y1R2dqdDZEdUczdk04K0Fm?=
 =?utf-8?B?RllLdmhyMXNLMm1aanJMRmRTaU9qSUJ0UGFSUG4vaUJSUkJtZzB3ODdXWm93?=
 =?utf-8?B?VUNIdkxIK3RTZENZUURnbGZwQnZTbk1uUkNEb3dnaHByM0x4cDR4ZldIcFF5?=
 =?utf-8?B?Lzk3dDAzcTk5SzlZbUxKRG1nWk42bm1YWmdNZ2IzOElCbHEwY1pwZGw1V3FS?=
 =?utf-8?B?SEt1TTd2UzcvYTJiYndNZmNxZ21vZFFwTEgwTVpmTXN3U3ZJK1JGUmxHcWZD?=
 =?utf-8?B?c1FGRmJKMjRSZ1YySDNoRlUzNW42eXJiM2hocHQrR3FaN1FoekVJRyt0ZEd0?=
 =?utf-8?B?c09DVlRqWHB2b2JBWDZxMjVsLzlRNXhXOUROQW1KclNwM01CaEhuVTR1U1hW?=
 =?utf-8?B?Q0h5dXREMnByZVozWDFzUUJHWnVpU1RCQm9mS2ViRFYvVVBUNnRXenhYYklz?=
 =?utf-8?B?VzJmOVkzekZDdFQ0cXdkdWpFSElKQWdkM2hBL2MraDNwR1NFM3E0SWs5S3Yx?=
 =?utf-8?B?TEloUmJPUmlueXdzS0RJWWdDMmJEQUpqTWlhcmc3NGxFSEl2d0s1REZxNndS?=
 =?utf-8?B?V3N3bGVwMnFSemdLbWtscFlHL3VSYmRhOTQxVXFnVHIySVQ4SmxnYlRrUjlQ?=
 =?utf-8?B?YThwYU56NFdJTDFwb1FzWExveVA4T1dKN2NTaG4zNkV1dHV5YUpad1pja20r?=
 =?utf-8?B?Vit6VkRVNERHTWlmb3dOdUtERSt5bkN3WmpGZUQzSnptU2dqVUE1UnBrbHJ3?=
 =?utf-8?B?Zk42RU5SWTZlRGxFa3BFcEtieXFoU1p3K0JxOGhwNnJManI4NFg3ZURmQnV1?=
 =?utf-8?B?aUdqZDZsSE1wRjZlLzhGekdESzRzM0VFRWduaGVRSDFPSGJsa1BCL1NDcUtl?=
 =?utf-8?B?YlVsa0plaVZ5MGZUaHNZenl5Zmh5Z3pNOC9QbWxMWmovcVhMNnN1cjdnVzlD?=
 =?utf-8?B?ZDBTeFl2UmNleDVRY05yNC9JWmdUNDVYaHlnUTFDM2NiUThtU3dKRU5PdWRk?=
 =?utf-8?Q?XP09i3ZID5KR104HCKwg7uw/CI9OqCluKB7ZU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2dIOWc3aXdpbjRQek9RcFc0SS82NU5iMWZFRXBaQnJLQWF1azZZNUdlNEx1?=
 =?utf-8?B?dEQzZks3eDNoQmlJYkppSzY5QlR3aG9DekFqeFN1M3BKZVNQT1JnMzlWMTNq?=
 =?utf-8?B?a1RwWGllRGFzUVIvSnVTenJ0SEQ3dUIvV0RCcU1KdjZFS3RWUTg0bnJoQlcy?=
 =?utf-8?B?WWJ5VUYwNkdNUVhVVGlvMUFXZ2R3NVBpOGozL2VaVWFUWkNHVGFNQXRxVzhx?=
 =?utf-8?B?RUxNVGNtNURvRUduZU9ZWjhWcEc2S3VTNnBlakx6cm90cjdGbzJRSHh5ZTVC?=
 =?utf-8?B?UEoydnRONkFBOFFkN2VEUGVLMjNzNmcyZ2g0aTZNd2JuZ2dkVUtzVTRpUzdn?=
 =?utf-8?B?bTJnUWIrblZDditBblBScG00RWdHMFg4aEY1RkpFL21QVTRIcjdQTnJWN2J4?=
 =?utf-8?B?Z0l3Sm0vWnFpWk5wbTJVeXVwdk1XOHJqeERTWmlWUzF0V0NxYkEyUVhKUkRU?=
 =?utf-8?B?aTBuRlREWENaWG5ZWDVsRmxpVEJxV21oNVlsbXFTZUxWcU1INGlWeEk1a0E0?=
 =?utf-8?B?ZmtCYVdjdmN5amZnMlVmL05IVWp2QmxFVENod0IyUTkrVFdUam81UXNCdnhm?=
 =?utf-8?B?cVVDTU1yNFFNNnJVck5GVmNyZWpPd3pRUzdOb2RCd0g2UHpxL21ydjVWN2tt?=
 =?utf-8?B?ZmkwTDNVNXFwWkZxaFRyVmR4emFLUFdZaHNkcmJ4YW1YdnlobEdaUUthQXNr?=
 =?utf-8?B?b051S3EwTzNoVHVZMUFuc1E5cEsxZWN5RGtZS2RJRFQ1M3hYZXFybnZUUlVu?=
 =?utf-8?B?a3picTFMdGl0QWd3SHNOTjJ3elc4VXJjL2VlSnFwM2ZJczIrNHN6Y3RSTzlX?=
 =?utf-8?B?aE9LTWYxYUdCVk9Xd0duczdlUk5uNU9qUXJDVGFJTVdkK0lSQVFlVk5GbWJt?=
 =?utf-8?B?c3VnRjJKc1B4TEpIMHRlT01rQ1pXS00yMmE0Mlk0SnBPWG1hR1QzeEt0dGhr?=
 =?utf-8?B?ZkdCTzhIaFhqYVNCMkhtQU9PYnl3ZTBaZnZ2a3liRlFHQXVOT3pCcWx2RlF0?=
 =?utf-8?B?TWxmcGkwZG9QbmRYMi9HQ0FKMEkwNkpYMGU1cmRKUVVpdlE4OEZGK3N0TEda?=
 =?utf-8?B?N2xzUWlEcS9xNGtLK2hMb1BNTVhsMzBUMTZ5YzExV3U4U2NTelZ0T1B4QUxv?=
 =?utf-8?B?cUVJY0xLR3R4dFJERHFNbDA2RitjdnMrMGtVdFFhT0VtRVdSZytkVmlCQk9Q?=
 =?utf-8?B?dXJNemNNUHdWTEVlVWYxZ1VKZGNyd3N3ZytiTUMyL2RqemFOZjZGSnJQbnFK?=
 =?utf-8?B?QkxHc05PUzdzbkxQVmhoblRhNndwY0dmcktwbDRYL05qRUZFdzVFM1NkcHhG?=
 =?utf-8?B?TjJMNFNmMW1KNHVYa3czT25BUFJKTWZXYVNheHZxZTA4eG1KS1Jia3RVRFJm?=
 =?utf-8?B?azJCaFZkQ1pwUmNUcGRIK21TSFhEU0hqR1VZSVJ4QlhBZ0VwVG9QN21EVnIy?=
 =?utf-8?B?bVppejk2Y0VWZzNRVm8rb0MzbmNqZ21ZdzdpZUFRY01XeFhmdm80QzNjUy8y?=
 =?utf-8?B?dEdENUY1VXRrY2JVT2JUcTRQZE9lb2FiY1k1SkRGekZaZGJCUUlCOHhacnVY?=
 =?utf-8?B?YlhKblhhTlY0Q1FBd3ZqS3k1Z295ckk1aDVtWW1vRnF2MDIrMllnQjNNTXVN?=
 =?utf-8?B?UnBLQnN6N21iT1dZTC9GRjdwNHpuZElhOXVPR1NNZ0h4blZWYS9oRGxqbFB2?=
 =?utf-8?B?cjdIaDN5RWh3b3BSOFB6NkpJOUlqRm1lM1RVd1dHWkxFbjd5Y1lxeUZvazlj?=
 =?utf-8?B?Vk40QXAwOThEMXZ2M2haZjFOeEowZmlBV2l1eFVBdHJYK0diVnRVd09FVm5v?=
 =?utf-8?B?OWUzZmhUU2lucjNHL3QrN09kY1lKSW9rZ3ZBWStBUlFqL21BdStZR1FUbElt?=
 =?utf-8?B?MmdESzJIb213Uk9BZjJZL0NIQ3NpWFlBamJPaTh6alpkei9kejlyS3V4RnVN?=
 =?utf-8?B?WjNjUzc4cnJ3akpKS05KUml2dERrUUQvN2VMdlN0MDUwMjk3QzZpUTM0RFFj?=
 =?utf-8?B?SXc4YUh4cS92SUZBY0RhRVBCbEZia0dSZUM0Z1lMWlpxMTdBOEhGZFZJUjNC?=
 =?utf-8?B?RGVYVHlBbENsUnV5ZkkvaEQ1NHdIVTIwcmUyaXh4bVY3SVdyT0ZYRjBFd1FT?=
 =?utf-8?B?RkVETGltYStCbk1MY3JubmNUUDczYXdqR2haU2NkclU0Ykw2MzVTUjNXM0Zy?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZTqefRII9IYi/OVOZrUGTMC4+IFSJm8asPRolvjA8mJaMRtkoXdl5Yg0Y3X0EBtzAT69EDvLNHBT1ZiZjudHn6f0CocyZTPMfa6GVnSowo9nqcQBGKvIqS5VfViTKxiWfMjTnCh1kWHFQ/jbLRK9byNUKINreAWmIBQnqLenXLAUkBVeCZmRaAkXGtPTw7jUVZFM26wCyHM8FgJEKHm959Y5Cx/ikzjgXqwG165cKB6dbRhudfPxJ2VtnPSBKk5iOVzUFuQOKwc0Zi0/ZA/BvYMwbIKpxN0P6sSw4OpV2t0Ja1Q0lPyC/Lmpdne7lSCloAU1XLBINgGW5iCrgunBV9hVvmSTOaxVD2uZzSqGaDLAi/zPsI9Yyh/oeyCManyCy3HcYy0othgxc6WvJP4gQ+oy8m2/Z72wCcTwAsfxttlDXSFUsBe8GBn+CHvaav5iTmnrknDWcrp0RDSvTMCCR7du8HNQh2hZntTNDeiINyCIYqj54eaW6pxOOubiQODMb66FIm3Vj30aetZWl2xePH/ZVpNkfomkMDvVIXSpli6Nt9Rm4duwXDYgtjg/JvbJfBfa290beCgxdHg0O7T0rea8MyhNliVXncNsbbyFz/I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e630fad-51f4-46d7-6812-08dd8c8bb27a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:49:38.3093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zh2DDPrY0Y8lNVlg2+nDNKwGMftVUI4fYRTHHJcnVyT8TDx/45jTT1JTICTYMA0PfIr9HQO81AxoduANDS/CqKZQtUTQvHwz2qPL4gVh8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4510
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505060103
X-Authority-Analysis: v=2.4 cv=S+/ZwJsP c=1 sm=1 tr=0 ts=6819e949 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=FP58Ms26AAAA:8 a=zd2uoN0lAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=59-QbVjxAAAA:8 a=yPCof4ZbAAAA:8 a=F5y46iI6zm_em1JUFNQA:9 a=QEXdDO2ut3YA:10
 a=IGXNCFnflQ0gJHagSJzg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwMyBTYWx0ZWRfX664g5CGlYSAq XsHN+R98dhUX1S3WMFPH0FEzdu8LiCoHBjEa3yM0D6v39IV88gcIicTetc0dfD/VHgW2/1lIetW fAjSQrZgUsz5urNnnKPf4w/NhUFkKfSQduPplsaKKfknG+gJuXpzahLBZpeH6GlIrjMsQcVeU1Q
 1EhjpXqPUfLbldyfZFQbOYMn5TQz7asXm2FOYMhheeVzN38V9d1NtiEhvviA8oLsoPb+9E55Aw7 6aYPO8u7nBK/HjeHE+tsnvVBTFwW6+rslOL0uTkwyuMHvV3kVRiyJdX1A3eUkWlLF34fdRoGU5J PATdEK3wzdG3GBKZMLKeXYnetibW5dO24abyRbcc1nmBm7R+COwqQRYxROku/66ETZCC46L+t7P
 mETNOJbyPwPMKRiOdNMatJrfWRw5GnfeLVlqsne8tViYuRYDAqW83nNZ11QFoa/Oi9U2ib3w
X-Proofpoint-ORIG-GUID: N4uDauPghPnOiYn0Ly4KrpGsYpv3mykC
X-Proofpoint-GUID: N4uDauPghPnOiYn0Ly4KrpGsYpv3mykC



On 05-05-2025 06:36, Derek J. Clark wrote:
> Adds documentation for new lenovo-wmi drivers.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
...
> +
> +
> +WMI interface description
> +=========================
> +
> +The WMI interface description can be decoded from the embedded binary MOF (bmof)
> +data using the `bmfdec <https://urldefense.com/v3/__https://github.com/pali/bmfdec__;!!ACWV5N9M2RV99hQ!MsBEzFjDFpZkeq1j7_77aBEv31FIW_V_vPvnyFGNSL_ptLYWAYFj1UMisJvhsTGRq3_lh5eh5RpYWjdlZUKTA0UZ9jO_$ >`_ utility:
> +
> +::
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO_GAMEZONE_DATA class"), guid("{887B54E3-DDDC-4B2C-8B88-68A26A8835D0}")]
> +  class LENOVO_GAMEZONE_DATA {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiMethodId(4), Implemented, Description("Is SupportGpu OverClock")] void IsSupportGpuOC([out, Description("Is SupportGpu OverClock")] uint32 Data);
> +    [WmiMethodId(11), Implemented, Description("Get AslCode Version")] void GetVersion ([out, Description("AslCode version")] UINT32 Data);
> +    [WmiMethodId(12), Implemented, Description("Fan cooling capability")] void IsSupportFanCooling([out, Description("Fan cooling capability")] UINT32 Data);
> +    [WmiMethodId(13), Implemented, Description("Set Fan cooling on/off")] void SetFanCooling ([in, Description("Set Fan cooling on/off")] UINT32 Data);
> +    [WmiMethodId(14), Implemented, Description("cpu oc capability")] void IsSupportCpuOC ([out, Description("cpu oc capability")] UINT32 Data);
> +    [WmiMethodId(15), Implemented, Description("bios has overclock capability")] void IsBIOSSupportOC ([out, Description("bios has overclock capability")] UINT32 Data);
> +    [WmiMethodId(16), Implemented, Description("enable or disable overclock in bios")] void SetBIOSOC ([in, Description("enable or disable overclock in bios")] UINT32 Data);
> +    [WmiMethodId(18), Implemented, Description("Get CPU temperature")] void GetCPUTemp ([out, Description("Get CPU temperature")] UINT32 Data);
> +    [WmiMethodId(19), Implemented, Description("Get GPU temperature")] void GetGPUTemp ([out, Description("Get GPU temperature")] UINT32 Data);
> +    [WmiMethodId(20), Implemented, Description("Get Fan cooling on/off status")] void GetFanCoolingStatus ([out, Description("Get Fan cooling on/off status")] UINT32 Data);
> +    [WmiMethodId(21), Implemented, Description("EC support disable windows key capability")] void IsSupportDisableWinKey ([out, Description("EC support disable windows key capability")] UINT32 Data);
> +    [WmiMethodId(22), Implemented, Description("Set windows key disable/enable")] void SetWinKeyStatus ([in, Description("Set windows key disable/enable")] UINT32 Data);
> +    [WmiMethodId(23), Implemented, Description("Get windows key disable/enable status")] void GetWinKeyStatus ([out, Description("Get windows key disable/enable status")] UINT32 Data);
> +    [WmiMethodId(24), Implemented, Description("EC support disable touchpad capability")] void IsSupportDisableTP ([out, Description("EC support disable touchpad capability")] UINT32 Data);
> +    [WmiMethodId(25), Implemented, Description("Set touchpad disable/enable")] void SetTPStatus ([in, Description("Set touchpad disable/enable")] UINT32 Data);
> +    [WmiMethodId(26), Implemented, Description("Get touchpad disable/enable status")] void GetTPStatus ([out, Description("Get touchpad disable/enable status")] UINT32 Data);
> +    [WmiMethodId(30), Implemented, Description("Get Keyboard feature list")] void GetKeyboardfeaturelist ([out, Description("Get Keyboard feature list")] UINT32 Data);
> +    [WmiMethodId(31), Implemented, Description("Get Memory OC Information")] void GetMemoryOCInfo ([out, Description("Get Memory OC Information")] UINT32 Data);
> +    [WmiMethodId(32), Implemented, Description("Water Cooling feature capability")] void IsSupportWaterCooling ([out, Description("Water Cooling feature capability")] UINT32 Data);
> +    [WmiMethodId(33), Implemented, Description("Set Water Cooling status")] void SetWaterCoolingStatus ([in, Description("Set Water Cooling status")] UINT32 Data);
> +    [WmiMethodId(34), Implemented, Description("Get Water Cooling status")] void GetWaterCoolingStatus ([out, Description("Get Water Cooling status")] UINT32 Data);
> +    [WmiMethodId(35), Implemented, Description("Lighting feature capability")] void IsSupportLightingFeature ([out, Description("Lighting feature capability")] UINT32 Data);
> +    [WmiMethodId(36), Implemented, Description("Set keyboard light off or on to max")] void SetKeyboardLight ([in, Description("keyboard light off or on switch")] UINT32 Data);
> +    [WmiMethodId(37), Implemented, Description("Get keyboard light on/off status")] void GetKeyboardLight ([out, Description("Get keyboard light on/off status")] UINT32 Data);
> +    [WmiMethodId(38), Implemented, Description("Get Macrokey scan code")] void GetMacrokeyScancode ([in, Description("Macrokey index")] UINT32 idx, [out, Description("Scan code")] UINT32 scancode);
> +    [WmiMethodId(39), Implemented, Description("Get Macrokey count")] void GetMacrokeyCount ([out, Description("Macrokey count")] UINT32 Data);
> +    [WmiMethodId(40), Implemented, Description("Support G-Sync feature")] void IsSupportGSync ([out, Description("Support G-Sync feature")] UINT32 Data);
> +    [WmiMethodId(41), Implemented, Description("Get G-Sync Status")] void GetGSyncStatus ([out, Description("Get G-Sync Status")] UINT32 Data);
> +    [WmiMethodId(42), Implemented, Description("Set G-Sync Status")] void SetGSyncStatus ([in, Description("Set G-Sync Status")] UINT32 Data);
> +    [WmiMethodId(43), Implemented, Description("Support Smart Fan feature")] void IsSupportSmartFan ([out, Description("Support Smart Fan feature")] UINT32 Data);
> +    [WmiMethodId(44), Implemented, Description("Set Smart Fan Mode")] void SetSmartFanMode ([in, Description("Set Smart Fan Mode")] UINT32 Data);
> +    [WmiMethodId(45), Implemented, Description("Get Smart Fan Mode")] void GetSmartFanMode ([out, Description("Get Smart Fan Mode")] UINT32 Data);
> +    [WmiMethodId(46), Implemented, Description("Get Smart Fan Setting Mode")] void GetSmartFanSetting ([out, Description("Get Smart Setting Mode")] UINT32 Data);
> +    [WmiMethodId(47), Implemented, Description("Get Power Charge Mode")] void GetPowerChargeMode ([out, Description("Get Power Charge Mode")] UINT32 Data);
> +    [WmiMethodId(48), Implemented, Description("Get Gaming Product Info")] void GetProductInfo ([out, Description("Get Gaming Product Info")] UINT32 Data);
> +    [WmiMethodId(49), Implemented, Description("Over Drive feature capability")] void IsSupportOD ([out, Description("Over Drive feature capability")] UINT32 Data);
> +    [WmiMethodId(50), Implemented, Description("Get Over Drive status")] void GetODStatus ([out, Description("Get Over Drive status")] UINT32 Data);
> +    [WmiMethodId(51), Implemented, Description("Set Over Drive status")] void SetODStatus ([in, Description("Set Over Drive status")] UINT32 Data);
> +    [WmiMethodId(52), Implemented, Description("Set Light Control Owner")] void SetLightControlOwner ([in, Description("Set Light Control Owner")] UINT32 Data);
> +    [WmiMethodId(53), Implemented, Description("Set DDS Control Owner")] void SetDDSControlOwner ([in, Description("Set DDS Control Owner")] UINT32 Data);
> +    [WmiMethodId(54), Implemented, Description("Get the flag of restore OC value")] void IsRestoreOCValue ([in, Description("Clean this flag")] UINT32 idx, [out, Description("Restore oc value flag")] UINT32 Data);
> +    [WmiMethodId(55), Implemented, Description("Get Real Thremal Mode")] void GetThermalMode ([out, Description("Real Thremal Mode")] UINT32 Data);

Thremal -> Thermal

> +    [WmiMethodId(56), Implemented, Description("Get the OC switch status in BIOS")] void GetBIOSOCMode ([out, Description("OC Mode")] UINT32 Data);

"Get the BIOS OC switch status"

> +    [WmiMethodId(59), Implemented, Description("Get hardware info support version")] void GetHardwareInfoSupportVersion ([out, Description("version")] UINT32 Data);
> +    [WmiMethodId(60), Implemented, Description("Get Cpu core 0 max frequency")] void GetCpuFrequency ([out, Description("frequency")] UINT32 Data);
> +    [WmiMethodId(62), Implemented, Description("Check the Adapter type fit for OC")] void IsACFitForOC ([out, Description("AC check result")] UINT32 Data);
> +    [WmiMethodId(63), Implemented, Description("Is support IGPU mode")] void IsSupportIGPUMode ([out, Description("IGPU modes")] UINT32 Data);
> +    [WmiMethodId(64), Implemented, Description("Get IGPU Mode Status")] void GetIGPUModeStatus([out, Description("IGPU Mode Status")] UINT32 Data);
> +    [WmiMethodId(65), Implemented, Description("Set IGPU Mode")] void SetIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode, [out, Description("return code")] UINT32 Data);
> +    [WmiMethodId(66), Implemented, Description("Notify DGPU Status")] void NotifyDGPUStatus([in, Description("DGPU status")] UINT32 status, [out, Description("return code")] UINT32 Data);
> +    [WmiMethodId(67), Implemented, Description("Is changed Y log")] void IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
> +    [WmiMethodId(68), Implemented, Description("Get DGPU Hardwawre ID")] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);

Hardwawre -> Hardware

can we Use value or status instead of generic Data where applicable to 
convey meaning better.?

> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of CPU OC parameter list"), guid("{B7F3CA0A-ACDC-42D2-9217-77C6C628FBD2}")]
> +  class LENOVO_GAMEZONE_CPU_OC_DATA {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("OC tune id.")] uint32 Tuneid;
> +    [WmiDataId(2), read, Description("Default value.")] uint32 DefaultValue;
> +    [WmiDataId(3), read, Description("OC Value.")] uint32 OCValue;
> +    [WmiDataId(4), read, Description("Min Value.")] uint32 MinValue;
> +    [WmiDataId(5), read, Description("Max Value.")] uint32 MaxValue;
> +    [WmiDataId(6), read, Description("Scale Value.")] uint32 ScaleValue;
> +    [WmiDataId(7), read, Description("OC Order id.")] uint32 OCOrderid;
> +    [WmiDataId(8), read, Description("NON-OC Order id.")] uint32 NOCOrderid;
> +    [WmiDataId(9), read, Description("Delay time in ms.")] uint32 Interval;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of GPU OC parameter list"), guid("{887B54E2-DDDC-4B2C-8B88-68A26A8835D0}")]
> +  class LENOVO_GAMEZONE_GPU_OC_DATA {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
> +    [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
> +    [WmiDataId(3), read, Description("Default value.")] uint32 defaultvalue;
> +    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 OCOffsetFreq;
> +    [WmiDataId(5), read, Description("OC Min offset value.")] uint32 OCMinOffset;
> +    [WmiDataId(6), read, Description("OC Max offset value.")] uint32 OCMaxOffset;
> +    [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 OCOffsetScale;
> +    [WmiDataId(8), read, Description("OC Order id.")] uint32 OCOrderid;
> +    [WmiDataId(9), read, Description("NON-OC Order id.")] uint32 NOCOrderid;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Fancooling finish event"), guid("{BC72A435-E8C1-4275-B3E2-D8B8074ABA59}")]
> +  class LENOVO_GAMEZONE_FAN_COOLING_EVENT: WMIEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("Fancooling clean finish event")] uint32 EventId;

Fancooling -> Fan cooling
"Fan cooling completion event"
"Fan cooling process finished event ID"

> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Smart Fan mode change event"), guid("{D320289E-8FEA-41E0-86F9-611D83151B5F}")]
> +  class LENOVO_GAMEZONE_SMART_FAN_MODE_EVENT: WMIEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("Smart Fan Mode change event")] uint32 mode;
> +    [WmiDataId(2), read, Description("version of FN+Q")] uint32 version;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Smart Fan setting mode change event"), guid("{D320289E-8FEA-41E1-86F9-611D83151B5F}")]
> +  class LENOVO_GAMEZONE_SMART_FAN_SETTING_EVENT: WMIEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("Smart Fan Setting mode change event")] uint32 mode;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("POWER CHARGE MODE Change EVENT"), guid("{D320289E-8FEA-41E0-86F9-711D83151B5F}")]
> +  class LENOVO_GAMEZONE_POWER_CHARGE_MODE_EVENT: WMIEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("POWER CHARGE MODE Change EVENT")] uint32 mode;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Thermal Mode Real Mode change event"), guid("{D320289E-8FEA-41E0-86F9-911D83151B5F}")]
> +  class LENOVO_GAMEZONE_THERMAL_MODE_EVENT: WMIEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("Thermal Mode Real Mode")] uint32 mode;
> +  };
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> new file mode 100644
> index 000000000000..d7928b8dfb4b
> --- /dev/null
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -0,0 +1,108 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +===========================================================
> +Lenovo WMI Interface Other Mode Driver (lenovo-wmi-other)
> +===========================================================
> +
> +Introduction
> +============
> +Lenovo WMI Other Mode interface is broken up into multiple GUIDs,
> +The primary Other Mode interface provides advanced power tuning features
> +such as Package Power Tracking (PPT). It is paired with multiple data block
> +GUIDs that provide context for the various methods.
> +
> +
> +Other Mode
> +----------
> +
> +WMI GUID ``DC2A8805-3A8C-41BA-A6F7-092E0089CD3B``
> +
> +The Other Mode WMI interface uses the firmware_attributes class to expose
> +various WMI attributes provided by the interface in the sysfs. This enables
> +CPU and GPU power limit tuning as well as various other attributes for
> +devices that fall under the "Gaming Series" of Lenovo devices. Each
> +attribute exposed by the Other Mode interface has corresponding
> +capability data blocks which allow the driver to probe details about the
> +attribute. Each attribute has multiple pages, one for each of the platform
> +profiles managed by the Gamezone interface. Attributes are exposed in sysfs
> +under the following path:
> +
> +::
> +
> +  /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute>/
> +
> +LENOVO_CAPABILITY_DATA_01
> +-------------------------
> +
> +WMI GUID ``7A8F5407-CB67-4D6E-B547-39B3BE018154``
> +
> +The LENOVO_CAPABILITY_DATA_01 interface provides information on various
> +power limits of integrated CPU and GPU components.
> +
> +Each attribute has the following properties:
> + - current_value
> + - default_value
> + - display_name
> + - max_value
> + - min_value
> + - scalar_increment
> + - type
> +
> +The following attributes are implemented:
> + - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> + - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
> + - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> +
> +
> +WMI interface description
> +=========================
> +
> +The WMI interface description can be decoded from the embedded binary MOF (bmof)
> +data using the `bmfdec <https://urldefense.com/v3/__https://github.com/pali/bmfdec__;!!ACWV5N9M2RV99hQ!MsBEzFjDFpZkeq1j7_77aBEv31FIW_V_vPvnyFGNSL_ptLYWAYFj1UMisJvhsTGRq3_lh5eh5RpYWjdlZUKTA0UZ9jO_$ >`_ utility:
> +
> +::
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO_OTHER_METHOD class"), guid("{dc2a8805-3a8c-41ba-a6f7-092e0089cd3b}")]
> +  class LENOVO_OTHER_METHOD {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiMethodId(17), Implemented, Description("Get Feature Value ")] void GetFeatureValue([in] uint32 IDs, [out] uint32 value);
> +    [WmiMethodId(18), Implemented, Description("Set Feature Value ")] void SetFeatureValue([in] uint32 IDs, [in] uint32 value);
> +    [WmiMethodId(19), Implemented, Description("Get Data By Command ")] void GetDataByCommand([in] uint32 IDs, [in] uint32 Command, [out] uint32 DataSize, [out, WmiSizeIs("DataSize")] uint32 Data[]);
> +    [WmiMethodId(99), Implemented, Description("Get Data By Package for TAC")] void GetDataByPackage([in, Max(40)] uint8 Input[], [out] uint32 DataSize, [out, WmiSizeIs("DataSize")] uint8 Data[]);
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO CAPABILITY DATA 00"), guid("{362a3afe-3d96-4665-8530-96dad5bb300e}")]
> +  class LENOVO_CAPABILITY_DATA_00 {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
> +    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
> +    [WmiDataId(3), read, Description("Capability Default Value.")] uint32 DefaultValue;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO CAPABILITY DATA 01"), guid("{7a8f5407-cb67-4d6e-b547-39b3be018154}")]
> +  class LENOVO_CAPABILITY_DATA_01 {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
> +    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
> +    [WmiDataId(3), read, Description("Default Value.")] uint32 DefaultValue;
> +    [WmiDataId(4), read, Description("Step.")] uint32 Step;
> +    [WmiDataId(5), read, Description("Minimum Value.")] uint32 MinValue;
> +    [WmiDataId(6), read, Description("Maximum Value.")] uint32 MaxValue;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO CAPABILITY DATA 02"), guid("{bbf1f790-6c2f-422b-bc8c-4e7369c7f6ab}")]
> +  class LENOVO_CAPABILITY_DATA_02 {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
> +    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
> +    [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
> +    [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("DataSize")] uint8 DefaultValue[];
> +  };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1afd30d00aec..675f4b26426d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13158,6 +13158,13 @@ S:	Maintained
>   W:	https://urldefense.com/v3/__http://legousb.sourceforge.net/__;!!ACWV5N9M2RV99hQ!MsBEzFjDFpZkeq1j7_77aBEv31FIW_V_vPvnyFGNSL_ptLYWAYFj1UMisJvhsTGRq3_lh5eh5RpYWjdlZUKTA1y38Zxx$
>   F:	drivers/usb/misc/legousbtower.c
>   
> +LENOVO WMI DRIVERS
> +M:	Derek J. Clark <derekjohn.clark@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> +F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +
>   LENOVO WMI HOTKEY UTILITIES DRIVER
>   M:	Jackie Dong <xy-jackie@139.com>
>   L:	platform-driver-x86@vger.kernel.org

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Thanks,
Alok
