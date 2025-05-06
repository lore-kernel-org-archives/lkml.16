Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AC5278E5D;
	Tue,  6 May 2025 11:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531126; cv=fail; b=ZeLqXSxjQMOTIB2dTUUuLxtN9e1sQydSaN3TvleAqPuFULCAPMliw4YM+5jYU2dDxm7CZDxfI09PD6bmC5Eoc/AkjD/RU3lK1eaRKhInPCtgNxp/DaVhZhAouoNWj/m9sw3UAhnJcQoGZF+IweKCul/lQUUR+NrQqatkwXSuV8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531126; c=relaxed/simple;
	bh=em//iLmcNmV5i8bSpBNPgbiMdJOT/X84XbKpzEYvgfY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ToyQkDlGuW3qgivthcxpP65YVsAkvDn0F9jmi7b7Ut7y1gXC5obFnKkecFSBzcgtGoXATF7NZ8k3i3nPJue7t5yRuWqS+WRd5C5BMJXoWjPkAYJMh6MJOJWCU2VsIgRgmETbijB33dprLJxhicZ2EMq7+eDbYgSARq5N870mkkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hfTqswq/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TLqQVZuv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hfTqswq/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TLqQVZuv"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5469w91d020823;
	Tue, 6 May 2025 11:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BC+1boMNtyt7m7fJjEOwDBCL7f00LA0637yJw4wgNpI=; b=
	hfTqswq/aa5ODkbf7C29N0eKTtOyaAH0EU+homXRV19kZO9oNomOytoorHA2HCPr
	96HaFUkXFoNfCOphGcb08fwk9rqsdbXEBcrVAdYnx5FkZnBDpifumr0CS0qVFxt+
	VY6Ui5qLehuCa6SJnAokRX7In5/Oj4vSricV/HbHbje1cCHiUktZjchmFHoW7r95
	JVNAxlCnB7rIckRtLFdrlGRBm6vZh1ktogOTdftQ7SZrxKImEiQnO5cQ7VAda4uA
	inEFCk1oY03M1wprhVN4kE+uwl78cJVngrwkiZAszsgei6fcRXTTmZD470Hd4NCl
	Y6stCwHLffXMNE5W7gGcIg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fg8ag5ae-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 11:31:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5469pWiu037530;
	Tue, 6 May 2025 11:22:40 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012033.outbound.protection.outlook.com [40.93.1.33])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k8m6sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 11:22:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utVI14+WAI20xi2mQrurABy01e0bx1ZGJe/t+FSs+hTOutPhuMNbY1uMPuinn5DmYehGpu+Lq44ZiN2EGE4wSUjrWzHHD60oU1S67IN1RlBNS05e5tcAhLHPkKDp/GXvV1RbRr+nnJiytsEjPyijqHAmqhqjKG2TVLSwB0//Tqdp7x4sU5lRtCiuK51zvr5qodfUC3RftW7FLSnnsTm4fkqIuhLVG69c7p4/XJCCDqUx8Ybp7XqNGLg6p2GiOkVERT8kVXn3/fUreqgFE+LDguxEZqKM29zbLqCGKzduaASiISapzU9k1uA+8ciRPn2MpyzjpTJe7Gxd22Z43x+kmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BC+1boMNtyt7m7fJjEOwDBCL7f00LA0637yJw4wgNpI=;
 b=TGgcKGIxYCFy4c39KiDjtau5a6+a6LjL/D8WCwVubIbwEP548y85cpcMx7OIDeB65P/C8xLYW7roStYuhwIWELz8UtLSQo+hxSjvQOkFXSsshiY3JG+EOP0f4RGcED60tj++4autC4fbpHr5IUcEWL4oVVnRwYdqZk8tO0xY5T9QTSaT+Ow0SibLzWfq88FMbNyCSZNiHMnRhsw87SGUslvkJQr31KoSXxjoef4zrFdybRWKjser25oKIwcoTxwtT6ZqcM1maTQh3rApXPOVhQszxAVdz/eUhkZAi7Z7hfeRhvRRpxn6mPm8W3vE0ZkGCBMGN8CSZBVRWfOPDtmfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BC+1boMNtyt7m7fJjEOwDBCL7f00LA0637yJw4wgNpI=;
 b=TLqQVZuvfhkgmot8I0hO2P2o3KOpGLyh/AxIJW1c1Acie4xuUOelwqYYvttTE1Gdk3RkD0UGimiBdU+LlEGMrz1Hl10WYJWdgl4OzRfmGcTnHkjF1SeFmnATM3eob5ANsAzqAxqbT4yfVul8Gp+UbKgWjZiyT6e8ilZn0WVV5JA=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by IA4PR10MB8520.namprd10.prod.outlook.com (2603:10b6:208:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 11:22:34 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 11:22:33 +0000
Message-ID: <4d72694d-55d5-4275-958f-af1f49aa5775@oracle.com>
Date: Tue, 6 May 2025 16:52:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] platform/x86: Add lenovo-wmi-helpers
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
 <20250505010659.1450984-3-derekjohn.clark@gmail.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250505010659.1450984-3-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|IA4PR10MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 55009c06-5b25-4fe4-4d2d-08dd8c904bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0cyMGJHTGRudlhvcGJ1SkZtOTh0dW1wQ0hBOFBlQ3ZkTTZmSGZBUVJzTEVH?=
 =?utf-8?B?ei84cTZKQVNodXY0dms2S2ZvZEJ5QmlzWUVIVVdmaUJJNUZrcGJlbTJWc0tZ?=
 =?utf-8?B?K0R5cC9RNEx6My9kUW5RMjRaOXljaTVVK2JMcThVcFR3VWJsUmNGQkJ2OUhI?=
 =?utf-8?B?ZUNlTHIzM1BmNTZXVzFGUDVrSFc1eDg1dk85eEdKclVwNE83Z2FVb05rMlZK?=
 =?utf-8?B?d1Eyek02YkNHaTZZWkI4M0U1cis2Q1ZZQkZVNlhaY2Zhc0ZkYkMzV1BkYUtF?=
 =?utf-8?B?c3llNzYxYnlJajQ2S0NnbUVFaHdPMGdwNUxOMXM1ZHpDTGc4SkVNNlg3d2Er?=
 =?utf-8?B?L2l4ZFl6RG9qVjJXUXJDYlkyK2tnTUVMbVZib3FrRWt1Z2p5QWRPUUxQTGRU?=
 =?utf-8?B?Smh2Wm5VMEl5QUxtSzNidmVuY2ZUdk9SUWowN01CNXFRN2FlaDh3Q2pab2xJ?=
 =?utf-8?B?Nnl6b2pFQ2RTZU9GWU9CMFhVdDNvQksybHZxWnk5azljeGRSZHZjMnp6Qis1?=
 =?utf-8?B?dGdjMFk2Sy9XK3VuWWVQOFJ6bk1GOFRmNjltQ3lmUms4Wll2SlVBdC8zOXFG?=
 =?utf-8?B?cGE0OHMvQXlqRlhMREdsUzFieC90dS9HTWJQd1hJSjJmK3NBMTdWelNLU2V3?=
 =?utf-8?B?MWJtaTNHZG1pUklTZDBEY1YzN3dKdTNTL0x3cmQycHZ4NEpoQkNLbnVKR1Jn?=
 =?utf-8?B?WWJRSkNWREhlSVlzR0xSUUtNdUdmYkhZRStFUWxQeW1PMEdKeHc0RmQ2cy8z?=
 =?utf-8?B?Tyt1TVBKdnA5dVUvQ3lUenVQYTRYeTFWN2RIZzE3L0xBbUJnMENtY3NCRFJm?=
 =?utf-8?B?eEJzSll2SzZhLyt3VDZNeXNnWkxBUW9zMThONU9aN01qc3FON3BtaDBRUVVV?=
 =?utf-8?B?Z0lBd0thcWlFWVBGRkkrUVlsVFdUaER4Z0NYbUlKNUkzeERjTGF6MHRpTE5P?=
 =?utf-8?B?UXFZNEh1U1JQcHlTc2d2ekdzMGxMTkVHMWE0Q011L084Y1RTTTMzTHUwUjY1?=
 =?utf-8?B?eDhnWEl4Q0lhOW13c2RTeWwwb3FmclVPdHJKN3QyZ2lNWi9nU0ZkdWwwUHNp?=
 =?utf-8?B?SWl5VnA3QnMyTG1FU055aGFRTjBHbEtkS0M4QjdqTUtaczVERmNQK0JteFh0?=
 =?utf-8?B?ZjRoU0R5MEVqYUp6QWVlWG00WERFVmV6ajVHYTFKWUdZQnhuYlEyV3gxOGZq?=
 =?utf-8?B?a09qYWt0Z2ZoVkhBUDZxekp4dDBDMm5lNU91dEEvbmtSWUV2UmtRbThaUW1F?=
 =?utf-8?B?MVFHRVEzdlFKKzNjRDdZaHIzTEdlMUhSZEZWNmlkUVRncXluUGN1ZkRUeDdC?=
 =?utf-8?B?RWdiTk41bVVRdkc2c3BZdUduZjJjUTh3YVZ3K3d4NWpaZW44WFhkZTJSeGFG?=
 =?utf-8?B?WEZpb05qUEhHWHFnM00rVkxuTTZHcTMxb0hOVTdadGlaM250NVpOMFI1b2hm?=
 =?utf-8?B?eEhPLzVhNWZiWUFFSE4rTEZnMkF3QXp3NGNmdWtaenFkdWtMS3Uvc2JCT0RM?=
 =?utf-8?B?OTRBSGN0NVZCQzkwUXh6Zm9tV0VZQm5uTytIUEFjdjFkby9jdEZDODNrV2Jy?=
 =?utf-8?B?R0EyeDc2Z29CNFo4MjR3Y2NsQ25yU0loRFNSVVErYUZVdmRTSy9FTjVPRW1T?=
 =?utf-8?B?M1pSZXJwZFVqSFhUT2FuU1dmbXRXcnBvejVQanA1aFhQMjdTYTdBc3U3RllM?=
 =?utf-8?B?bStyWmEvdEJIM2RZMUR2cU94Q1Y5VVpwTkdveiswSDVnN0RINHdwOHB0a2ZG?=
 =?utf-8?B?NmlPMExkSkw3SlV1Z0I1eUtzblFSOWhtNklVUGlHMkhDTDRHeHoxRzFzMUpO?=
 =?utf-8?B?NUFiQlFNYi9UQ0JLVElqTFh3ZmV3ajVDU3JOY2x0ZzBtd25lMkJ2SFZzWXFI?=
 =?utf-8?B?L2xqWXdoY3RXcHRKMkxqQjZRQVlYaTRXejlHdDJCUGtMNnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFdjUjdKcFNiUzk1bXJWellnTE02Uk1UMWVTejhQTWpPb2Jxb05odFdZZmR5?=
 =?utf-8?B?NG84TEJKZHNGejc0ajFLYlhjUm9RZjVOWFRhNFBvdjE3V1hvc29zNllCQzlz?=
 =?utf-8?B?VmtQSFFWQ0FxNyszd1lUQkJ5VmtTdTBNbXljd1p1dHZtaWJqeWlqelo4bkdu?=
 =?utf-8?B?U09NNU9SUEY0SFdLWnF5RXZVSnFhQm54c09wYnNRdnp5T09BdEhiS2FIU1Ev?=
 =?utf-8?B?WEtRTU1DclBCSXFmR0RWaThWaEx1WFlQaXU5clQ1RG9sZFRhWkV0V2F1SE1C?=
 =?utf-8?B?by9qWXhhWllNZ0g4am9oRU8vR3JOSTBBZWtIdEJ2TmwvaEYwYi9uMEhHb2Zp?=
 =?utf-8?B?cGV0UWlpa3F0NGt5RTVLY0FOaHFJcy92UHpyeWNHSW93eGJ4dnV6ZHFEYUMw?=
 =?utf-8?B?ekFzQWpNWEt6Qjg0WnVKaDhyc1U2Q1pMbzhsY29iNkhQV2JwSVFadzJMMXJE?=
 =?utf-8?B?aFpveVNxMTh0K3hJSHYrQnkrTkVUUnB2OEk0VnkzNTY3SFJNby9nU21ta21O?=
 =?utf-8?B?dG5DY2oyTVVPay9NdmRSQjlqNkZlMWVLbWQ1cUdERitwbk1tWDhLRVpvTEND?=
 =?utf-8?B?NlR6ajMxNGtsaGN1T0V6UGNmOHU0WjBBemJUQ0JWSHA5V0U2d3h6bDl6ZUVF?=
 =?utf-8?B?L0E0aUNKV25XY2VpQWd0QUJVa2o0QzVubTM0UFBtai8xVWxIYUEvZU9xWEtO?=
 =?utf-8?B?WGRHQllScmFtVWxsT2N5ZXM3YWZhUUZhODRXZUw5akVDL3J0cDJXM0liQXB0?=
 =?utf-8?B?dFNGZFBtQjVmN2drK3hrNUl1ZjlRZWhxaWVwOCtqTUZkYjFJNjEyRXN5S0U2?=
 =?utf-8?B?c1RGU3ExdVRXeHQrZFhHb1k1QmlNcUZTYldSYkQzV2VoRjBGc1RzMm5UaU1x?=
 =?utf-8?B?YWVWYVVpTDRGc3VZWWxvRld1a2F6M2ttdjkzRUNaTEhVblpRWlluRUlaVHZQ?=
 =?utf-8?B?Y0tUK3p2dFkzd3BwN3ZINHM1L0EzdW9vWWkrMjZrbmVnZEZmeC9XNjhiTjFM?=
 =?utf-8?B?aUNTdVpheHpVMzNlcyt5YVRnWUY3bUtKOXZYeFBoTG5sY1ZPNlZrN3VCMWE5?=
 =?utf-8?B?NUNWTXR5OHo5Q1EwVTZVQUJoNlM1ekN1U2VOK0Z0RlgzbXFiRDdvRUh2b0Zn?=
 =?utf-8?B?RUFrZEFGM0E3c05FTGN6QThhZHM4UFExdFUwNS9OZUl1ME9HMUtGcFVwcTMv?=
 =?utf-8?B?Rng4dWFqU0Z3MzQyblpJdHJQVUxicUE1KzFkZ3gxNGtnNmppVnBzQW10TGZC?=
 =?utf-8?B?T3lKZVNzNGVxRmFzQmhJU1FGeDhmSGlHWSt0TGpGU3ZUVHJHa25iMjV5cjRF?=
 =?utf-8?B?MTBiZkdVL3BWclcyUDVPRVM3bEJyTnc0Z0hocytYem9zZDlwak4wNlJsZlli?=
 =?utf-8?B?NXlDcUtUcEQrcVRQSU0vdVJQNnFaellZUTFVKytPTmxnR3dIRVg4MjIxbVhv?=
 =?utf-8?B?TzUzOE5Zc0ZDTThIY3k4dEJqcm5BMjArb1NCTUgvVkNpQWVha1ZPaXpqWHdk?=
 =?utf-8?B?MzVndERqOVIxdTVQdkdXTWZoT3daQnBSZ0FlOUhXWXQxdFBXdE9EM1JuWHA0?=
 =?utf-8?B?OTNJWmlvbWc1KzNKQ3lMT2FDUDdBb0dFRnlKa2laZGx6YUM0bjNlaExxSk9a?=
 =?utf-8?B?RXJIeEMzTktzQ0ZUcFp0amRiUDYybGgzdlIyYXpyTCtKUE5jMFlUdnp4eTcw?=
 =?utf-8?B?YjNNaGpaVlhRSnhKR2JBR1FCaWV1YTYxU25TeWQ3TU16bUZuNlZjN0RTajdQ?=
 =?utf-8?B?MlBEWktzSlIvd295cngvN29GNXloZUI2NXdaVWVVcjN1dWFhYVFLakNmU0J5?=
 =?utf-8?B?MWFPcEoyeGEwUjlYNUJzN3JGV0ttdlF6T2FVZ2pITDdKQzBpSERzdGNQZW41?=
 =?utf-8?B?cGJSVXZmVnV1Nk5TQmJHVWFicWh5bm5VczFaclFTQmhYTWFSRW1Od3NOYm5X?=
 =?utf-8?B?NWFRRHlPT3QyOUw0K21yQi9YZFltVXZWYXpGcGJmeTNrdUV4c1IvT3lXUm52?=
 =?utf-8?B?VklOSnBxL0ljOVR2UHlIRUZZUXY0TlY4Uld6UGRMeTZwNjYyL200YUJmZGNp?=
 =?utf-8?B?T2xkMC9nczhxYmpGbktoUUxZQ1Z0NGk4MmV4WE42aXRCTDlIeG5pcjZFbFAz?=
 =?utf-8?B?eDhEcFVCOWd4RlVWVUVGckh4cklLbHozYkl6Q0UxQkV3ZDJReVRPR3VCZjhP?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kc6zxRIRuU8Lsy3frIY9OMMgRhYuTYb8SWlm1V2ZkiimikxNq+/Ldu6q8bKnjGDg4GGGun8ZXA6WY7WluSGm015kRGLFBXspBPMqEyq2R9BDXJYe/5oj/uEPzqzkI4Afda+VQNFwQTDuRxn82EmVmLGR4cNoYrSw6/HSbxPgwioT2i6VdfZj71u7b1gsQ4MuhJO6JcYP7Ei/SzmzPwLgwGrsOAUcu531MtZHiStWwR0Mk3gOB4tkIuYArgV/Tgl3g+bW24QwbSQsQERBy3iJeFcnWUFCAzuGSQKm1QUE3eMJ5vQtLjmT3lonf1SgHqxMhm7cLER4+v9B0QcB8AXWN8ivuefxXLx+eMKcL6UurnbqkKvBv9fE9EELmuIaiXkbeRRWyMo7VCoyZNlsjsF4IhvMZO4aKLjPKBODHuwZ5vhfv00ZQ8bLdFa/ccavLCZ+MlDjvTrLMtQGdCV6S7Vykb7olTzXxtUBV+0acb7YceIDgm6GGWOYC1r07xLTiC3Bhgt1juZMVHAhFqHqIpUJlt4hlw0SNHH2FC3pmmvJ94a3PMMLCx3tTzm2yFlk8oMmNp0qrPahYdu4IGSJLUJ/AOLc9RyaRoNSjKJ0o9Bifxk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55009c06-5b25-4fe4-4d2d-08dd8c904bfe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:22:33.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZYZLGzHeXPVOUyLd7Ds3rRFvgJdmx4yHg1IupbytjDCyfE8KlzgMUoq68/VPm1YSfY16R9F36NQxTX35Og5Tpbgp2R1oczs1DLTLNvxKO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8520
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060108
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDExMSBTYWx0ZWRfX22yRDfhYRcsl f4pHVLlcZz94sLW9dWaC3xSEfFtnwDODvc+o55o4dsh+yZrDVJVdNb4bokAXIRSaKqX8qpkdrBK M00sUBTR9rHLuk4DdVU3qlxST6nhBaGlWwUuPaS0X/Tu/XxfLeyYp/PHRysEhOZnKXQAnCAtzEG
 GDRR+aYjich5Ewu2OxyVB5aXjTVzYEUyOpPhqo1BrcwXPzBycWTAbAWKunRVoJEwolkilqbAK0X +pJGDyFMNK2UWHKHQPD+qaqRbKdYjjBVdNiSPTOBBKQaMWZm5xOtmxSzXo09K97mnGCPJlJ2VPk I3xxtjpMcxmt/tt62uYYtn7zp1NaEoBnYTGDhasAg47DhrRZ0Ksw0OcChJL3nLyTH93AdtdluF2
 7hz7HL9fzmJNGdV3ivsKcVzCoBZsH///axfKwBLj8xfuvFjGJqUmVwJJol9/GqDmIPsXrl2o
X-Authority-Analysis: v=2.4 cv=GZkXnRXL c=1 sm=1 tr=0 ts=6819f321 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=zd2uoN0lAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=59-QbVjxAAAA:8 a=yPCof4ZbAAAA:8 a=8-YAVYTJbHnczm04nqUA:9 a=QEXdDO2ut3YA:10 a=IGXNCFnflQ0gJHagSJzg:22
X-Proofpoint-GUID: bp9-zJhrv7BApGaDk6y6S3F6zEYTDhlI
X-Proofpoint-ORIG-GUID: bp9-zJhrv7BApGaDk6y6S3F6zEYTDhlI



On 05-05-2025 06:36, Derek J. Clark wrote:
> Adds lenovo-wmi-helpers, which provides a common wrapper function for
> wmidev_evaluate_method that does data validation and error handling.
> 
> Reviewed-by: Armin Wolf<W_Armin@gmx.de>
> Reviewed-by: Mario Limonciello<mario.limonciello@amd.com>
> Signed-off-by: Derek J. Clark<derekjohn.clark@gmail.com>
> ---
> v8: No change
> v7:
>   - Fix typos
> v6:
>   - Fix typos and rewordings from v5 review.
> v5:
>   - Fixes from v4 review.
>   - Combine all previous methods into a single function that takes a
>     buffer for the wmi method arguments.
> v4:
>   - Changed namespace to LENOVO_WMI_HELPERS from LENOVO_WMI.
>   - Changed filenames to lenovo-wmi-helpers from lenovo-wmi.
>   - Removed structs and functions implemented by other drivers.
> ---
>   MAINTAINERS                               |  1 +
>   drivers/platform/x86/Kconfig              |  4 ++
>   drivers/platform/x86/Makefile             |  1 +
>   drivers/platform/x86/lenovo-wmi-helpers.c | 74 +++++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-helpers.h | 20 ++++++
>   5 files changed, 100 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 675f4b26426d..aab59a777693 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13164,6 +13164,7 @@ L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>   F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:	drivers/platform/x86/lenovo-wmi-helpers.*
>   
>   LENOVO WMI HOTKEY UTILITIES DRIVER
>   M:	Jackie Dong<xy-jackie@139.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 43407e76476b..bece1ba61417 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -459,6 +459,10 @@ config IBM_RTL
>   	 state = 0 (BIOS SMIs on)
>   	 state = 1 (BIOS SMIs off)
>   
> +config LENOVO_WMI_HELPERS
> +	tristate
> +	depends on ACPI_WMI
> +
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 650dfbebb6c8..5a9f4e94f78b 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>   obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>   obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
>   
>   # Intel
>   obj-y				+= intel/
> diff --git a/drivers/platform/x86/lenovo-wmi-helpers.c b/drivers/platform/x86/lenovo-wmi-helpers.c
> new file mode 100644
> index 000000000000..93aded3d24e9
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-helpers.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Legion WMI helpers driver.
> + *
> + * The Lenovo Legion WMI interface is broken up into multiple GUID interfaces
> + * that require cross-references between GUID's for some functionality. The
> + * "Custom Mode" interface is a legacy interface for managing and displaying
> + * CPU & GPU power and hwmon settings and readings. The "Other Mode" interface
> + * is a modern interface that replaces or extends the "Custom Mode" interface
> + * methods. The "Gamezone" interface adds advanced features such as fan
> + * profiles and overclocking. The "Lighting" interface adds control of various
> + * status lights related to different hardware components. Each of these
> + * drivers uses a common procedure to get data from the WMI interface,
> + * enumerated here.
> + *
> + * Copyright (C) 2025 Derek J. Clark<derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-helpers.h"
> +
> +/**
> + * lwmi_dev_evaluate_int() - Helper function for calling WMI methods that
> + * return an integer.
> + * @wdev: Pointer to the WMI device to be called.
> + * @instance: Instance of the called method.
> + * @method_id: WMI Method ID for the method to be called.
> + * @buf: Buffer of all arguments for the given method_id.
> + * @size: Length of the buffer.
> + * @retval: Pointer for the return value to be assigned.
> + *
> + * Calls wmidev_evaluate_method for Lenovo WMI devices that return an ACPI
> + * integer. Validates the return value type and assigns the value to the
> + * retval pointer.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
> +			  unsigned char *buf, size_t size, u32 *retval)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *ret_obj __free(kfree) = NULL;
> +	struct acpi_buffer input = { size, buf };
> +	acpi_status status;
> +
> +	status = wmidev_evaluate_method(wdev, instance, method_id, &input,
> +					&output);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	if (retval) {
> +		ret_obj = output.pointer;
> +		if (!ret_obj)
> +			return -ENODATA;
> +
> +		if (ret_obj->type != ACPI_TYPE_INTEGER)
> +			return -ENXIO;
> +
> +		*retval = (u32)ret_obj->integer.value;
> +	}

a '\n' before return

> +	return 0;
> +};
> +EXPORT_SYMBOL_NS_GPL(lwmi_dev_evaluate_int, "LENOVO_WMI_HELPERS");
> +


Looks Good To Me.

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Thanks,
Alok
