Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011055.outbound.protection.outlook.com [52.101.129.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21C92CCDB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743474120; cv=fail; b=O0WxzSDSj8WvOavg86tAJvFDSkwVKUe7x8IRBOyhSR4GeZryggf4e7c4vkSXSz3LE0AEUlKdxFiel2adhzdffleAVMPkCqsrk1B+p6zJaGjuPQnDnRDHx4H+kV2plMjbXkvFKbYGHm5V6penRhY/mFTbWu+OQ0TfW0PaV40GBHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743474120; c=relaxed/simple;
	bh=Y9BHA7e+lJq8sBSsz2h2aWxv/lBV3Fv+Sf6y2T0NP7M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uHcUJuGdWAzHzqILpwSKJtCpS3uT9cb3Ra5AXZ8PJdmtKG9nJ8El98jytLj/W7GPmKh79pQu+lTbdcu4K9FpV3SZ0hi7zELxu+YqsIu6EgyHzJ+eWCkd/ZB7n0kZl/HKSsPI+risUYE3yq/g7WUZHnpn8Ez9dtvDxiH4LA0Gd+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Fvymq8nl; arc=fail smtp.client-ip=52.101.129.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Fvymq8nl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v39Xq2APpn8bCXg3IOn/Z2wyg40m1+2HgLYXgokXf/8eEYY/+9PhgrfmhRztf9ifX0Ce0NCtnGHC3s+ixsb2hqMGYPkILstXsm9ouxgzEe/XYJQmKe/gDLPb59f+4aREFeYVG1TN9J2WsVWvavUOdnR2pIVkKb6DjuJMGE2oNtzn9nyBvTQM3WELnGP0aOwq4Q2DEqyWJOgSQ6cMUU2x9ixJgb8S2Hprv8J3fzGefH9//3YmgPUJVPXlUloBLNYIPF6r5zClcjUYZ/8v89/7ykihZP6Rvwi5ZBOU7WXuonSlLzJ05AW8+npMF3h8cguhoBfen6Faxa1NC8dm9DTCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqOnqstugv3YAeGdBM23JScMcgc6jXUtzetOwUESK+I=;
 b=fJWScEnoYPjVfU7bf+KaTCvwFQ0uRAKRtk8blwBa8cEBaTy6KqxVKeUkb3Kl1SltL+A2WQSGfTioWzrq2TM2yErZebKyP3ujgQdq2shi6M/BACrIxd1lIDoZ35q5FuURA5cs8+fPYvTZ5yXnbuGWMThB09qpz/sXVy9gWSmaujbd4MZmJS0vqH/F1OT32bVz6sX6AGrdQ0whNot62fLADkCaAhcDd2UAbRspH0Pa6CSfYKl7AJSa15RMksMH+ZYfNMjoKnOF12Omi21fd9gDIkupJcsxBirtUxFgp9G43qXhRnwzDg8QF74um6JZxl4tmXQS1MqsTKeNcGGENfm9GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqOnqstugv3YAeGdBM23JScMcgc6jXUtzetOwUESK+I=;
 b=Fvymq8nlkOF+mDqIz2Lp46mbSmUg8aQjYFbNH7hkdsTvEqIc2pWz0y0qZ2/1yEPr4zBL/E4nXOnNvexWBeF07bf5l63y3r3RKXwVtQPXTPxEvmMmq/F6gFDHsapteeBvqLso35WyFt5ulaItTpvu/AdDfO7Owo+2EAE5H28dKQQDhSne57QcE2OhMf+yrm+IC01ihDPxz5sK2TrwHYCfnb0OVO5JbOMq9vLyBuFa1mzSO4eN61Z6LYlXyDq5Ht9o5aSMQnVB3QCsx2PqSyocHHW/V3tptZT+Q1L6HN8uuPntbUYNV0QhhW5lujYiOe1SsrsiY25ZTuGpyPuw6z9OuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6436.apcprd06.prod.outlook.com (2603:1096:400:475::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 02:21:53 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%3]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 02:21:50 +0000
Message-ID: <a3618dd8-5b4d-45d7-b619-1c89ca7fd6b5@vivo.com>
Date: Tue, 1 Apr 2025 10:21:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/1] Introduce vmap_file()
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, linux-kernel@vger.kernel.org
References: <20250328211349.845857-1-vishal.moola@gmail.com>
 <02ba63ed-ef1c-426d-b469-09878c5f03d7@vivo.com> <Z-tGXf5mfTclxZgl@fedora>
From: Huan Yang <link@vivo.com>
In-Reply-To: <Z-tGXf5mfTclxZgl@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0213.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 898f6c3b-2aef-4c70-ba95-08dd70c3f5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3pmRnI4TzF4TG1SM1lYKzUxK1E3a2E3U1RjZEl5ZjNqeWZWSGcrSlhGUndn?=
 =?utf-8?B?a3MvUjdraHJHcFVKc1h3UXJqdms3WUhJVW42VXBDZUlMUFBFdzFFZ0VpSlNz?=
 =?utf-8?B?dU5PVXBKOXczTCtrcW5vKzdEWUsvU3MwemxoNk1tNEVOZi94eVVuQjJGWTN2?=
 =?utf-8?B?TTE4QlNTaUxFcjZlL0E2cDZWVVlMbTltWWdoKzNiSTJPcWpGeSt2ZG9QU1Rh?=
 =?utf-8?B?QTVqM2E3Z3ljSnFVZ09vcmZvLzZCN1ovR3RZTlloT3YwYndlVjVRT1VLWVNo?=
 =?utf-8?B?WmNxcEkwUi9pNnJXUS9iUXhGbUo0UVh2dk8vbHRlb2VlMHJ3VmY1WS9sSTJE?=
 =?utf-8?B?ejRpd1VOUWdnRVVoTTFSdnNPOTJxQjEyQ0V3dHF4eFUvOFNJOC9FY0JieE1K?=
 =?utf-8?B?bFNKcE1KTnB4VTBwUU9sdlM0c0V5SEtrUkd4RER2bkE4dDFwRHB1Yk5TMjJy?=
 =?utf-8?B?UThPNUMzSEZyQmtVcExtTkZqNm1BaTlZaDEwb01WT3Ywb2Fad3FiVTFweXZj?=
 =?utf-8?B?bk1tbGt6QThrRldFcFNNWXVpTTcwaDR2Z2c1dmNqaG9qM1A1MitIZnBzU1g5?=
 =?utf-8?B?SVRYcE1Zd0NweTA3aGxDampTaUwySFFIU2cva043R2VpWjBLLzVuRzRIM3Zs?=
 =?utf-8?B?cUxMRWRrMzhORkxMYzRyOWlmMCttRS83aW13TUtBQXptei9oNTRIQlAzRlkz?=
 =?utf-8?B?U3ZhNU8xZ0xQSjFoYUtEazdQRjZsWjc4YkVwd01qU2lNa0NIbzZCMWovOUYy?=
 =?utf-8?B?Q3ZndEdOaytnSktNYmt2N01lSHQycmlyaGFMMzBpSTVyZkhCWnV6d2ZSWXhq?=
 =?utf-8?B?Q2puN3o5K0NSbjZjdmN0UktHMDdMczRIMDBBZTRJNklQZ2pFUGpsZU03TjQz?=
 =?utf-8?B?L2VTSXREWEE1Qm5Xby9tRC9zRDVoVitqbHBpZ2tTT05FR3AyQlBxTWY2Wit6?=
 =?utf-8?B?TkdmWHhPMTFZdS96amcwdmRXSjFHRi9aamF2VFZJZ1A0ZGE0TS9QTHl3TVoy?=
 =?utf-8?B?b1pvT3BGdDRrRTQ3MStwTkZobzdNR0pXQ3FISmphQTNETFJaQzV1TnY0K0xz?=
 =?utf-8?B?K1dJWGtUTmtPVG00eFNtTkFudFp6amFCVlU0NWMxdFI1akZBTWthVHZoY1VM?=
 =?utf-8?B?UkVBem1aVjBFTVJJa1RaYnNKeEF3MmNOZHdSUXRMOC8rUTJuTG1XMTdaeE5a?=
 =?utf-8?B?Szc2MlUyZFZnVzdNOU5YelY3RFpvMGc0YWIvTG1yMlJScWJvdEdQRDhXamRQ?=
 =?utf-8?B?OG8zN1hYekJOdWVLRjQvdVRzRmJXNjFiQnp4TldUSE8rZHBXR2QxU3E1U0pU?=
 =?utf-8?B?VkcrWUxRbUZKSGV5blY2Vng2RG1PbzJBOWlsMWt4STFBYWhLNkRDUW50a2pt?=
 =?utf-8?B?bnF3RFhQV2VtQjNjNjg0dTlhTC9KQWIvWW1KMHZzVzFsMnFTOUt1R1c0aU1a?=
 =?utf-8?B?eFdxaWFhalMrWkJJbXZOL3RQVU95N2NhVEJvb1hOeDRYTC9pUmxYWUFybUtO?=
 =?utf-8?B?bVRGRGFXaWt0My9ZNzdFckJyYS8wUjBTTHZSNzBqMC95UVYxaUxLK1h0a1NG?=
 =?utf-8?B?U3BtN3NqTU5zMUoycHRrcUZVdTNUSFd2MWhDRW5uRkQrcUVnVVFpbGxLL2U4?=
 =?utf-8?B?ZmlaNkk1dDJZZE45ZzY2Mnd3bTltQVdxZVc2MVF4UStRRHd1MDZ0R0dsd0dY?=
 =?utf-8?B?cG5ESHNmbG5HdnZWRHhjSnhWbmUzcWRwZkZybGFhL3lWMTNQQmNad3lFVzJF?=
 =?utf-8?B?TXB0Rkt0cG9wU085UE1XRWFET3VUOU8xRVhYQ0RINFloSzlRbmJMYkYxN1Bn?=
 =?utf-8?B?YnZFZ2xsR3JsSWRtbW1Kc1JuaTEzVjB1eXFhejVPMUNKajd0OWNSb0ZBbVI2?=
 =?utf-8?B?bEt5YUlTNmV4cWNFL0pCdTdXb0xrTGJpeVZRSXFRRHBLeTRnejZUVlFDNDNi?=
 =?utf-8?Q?8JBjl2UVt+mahYznHvoN07Oo6UT3BKtE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1o2d0hMMnU0dlZibCsyOGJ0UnVOazlFTk9HVTJxbjBUck1TdFpvVTZOVU5Y?=
 =?utf-8?B?S09tNGpxV0xLRnoydEFLOVZhcGNTMTRkTkJmUnNXeTd4Z1NnN3QxYnFHWkVp?=
 =?utf-8?B?YmNLYWtvK0FFYmlZRlJhU1FxVUkzMzlacGdOQU1NcU5iUExBd0N2dVh1aFhn?=
 =?utf-8?B?Ky84SDBxNGtWUXBKeGRmZ0FpaHdVZWo5U3dxQ0ZrT2s1anZ5Z28reFZ6K1g2?=
 =?utf-8?B?cGY4dUVka2tzVXhmQ1VFbGlkY2M0Yml3WTF2TjZiTkpNeUJEbGhTQXhxRXcr?=
 =?utf-8?B?UG56UVIzOGlEbWNEeHpDeDQ1MTYvQkVFUTU5WXJwN3FHbVhYc3FBSnBpRnNi?=
 =?utf-8?B?ajFLQ2RuUjFTaWwrcVFoNWc3M0ZzTXFvRFZYdTBLd2U5TUljY2QrWmlIb2x1?=
 =?utf-8?B?dFFGdko5MnhPSjVldkpFSGFhZUw3Ly96RlRET2Jha3ZmV09XbGRicitQR3BF?=
 =?utf-8?B?TnJlenhGa1FiUnNHZmJUNzRtend6SU12cXVUT3JsUktZUWVZRGFZNjNrR3pv?=
 =?utf-8?B?Z2hIa21Xbjl2djJjdUxaWURMSjFsQkIrZElydXJNd256c2JPLzIxcFduUS9G?=
 =?utf-8?B?VEdmYkZlVEQ1ZExNZE9seFQxZS9rSW1qUG1PVkNHd1NxWlJBQk5XYUFXZ0FS?=
 =?utf-8?B?NU5KbTYwbU11eUpIR3podml2SVprOTV0Y0NkR1ZEZTF2VmdPWTB1WGpDTjNM?=
 =?utf-8?B?U3l6ZlRMOU9uUVhqNktuNDU5NUJ4WDhNY1c4MlNybnMzNWsxb1E3ME1VSzUw?=
 =?utf-8?B?M2tyN3hQV0VZOENMMWZ2bTN4R1pnbXNnbFVMZ1p0akFPSHJxeXo0aWtaVkxi?=
 =?utf-8?B?dDN1cXZCMWp3Q29ZTEhiK2xTbk5Udnc0NGgrNlhMZzY1T2pweGF2MjRmczJs?=
 =?utf-8?B?dXlHQU1qKzhiT1ZhQklRcFNPYzhOY05VZE1KaTlaSDRmZ3BJNzRKVVlDK1dI?=
 =?utf-8?B?RW9mMVNETTlNakF1YWtNd05Oek9mZk9pRkR5ay9KdjJHSkp6OWwxRnNDaGpW?=
 =?utf-8?B?RmVXZjBXWmFRYTJadkZTZnhSUC9SYjJlRzREUFlxUWJQVmkwZnBmRjdtUUI4?=
 =?utf-8?B?RjNuT0VmemJqYkV2a0c5d21NUzAzUzkrNzhmMnpNY2RIQWg3Y3o4elp1NWhU?=
 =?utf-8?B?amNhaWlUZWFMeXV3TW1WaHlSV0E5S2lUMTFpL1krdTFrQ2hpREpVd2ZxVmdN?=
 =?utf-8?B?MG5KNmhnSXRwNlRMVmtuU1pKL2kvanpaM2RqSHRLZ0NlY2VLZTdHVTNiRzdD?=
 =?utf-8?B?SWNCNXVRNTE0K254Z2FERkFvVW5UU2ZENVlvajlYUFRLbjlhNVdkeWMxWGg5?=
 =?utf-8?B?VEF5NEdHZlREeXFzNzk3Y3c2MEN2YjNHbEpGc2pNTlJpN3FRTjV5ZStxcmRE?=
 =?utf-8?B?QW1uMmpJcDd2RzQ4UlRKT25ObE11eUdLeE9DTlJMdFFOdW1oNlVmVHpDbXk5?=
 =?utf-8?B?Zlh4am80VGM1YTg5MEh3aGo5SDZ0R0NqUG5qbDVyUk9lRGIrVERDMHhFVWJF?=
 =?utf-8?B?VW9HZXhtUUEveWZtQ0FlVlJERzhiZW1CaVFVREFJVUR0c2NLYWVTeStEY21k?=
 =?utf-8?B?T01MNk9kMDR3RFNDK2EzUFBqenY3S0VKOWxTS3U0SXhsTHRtMG1JdUVpK2gz?=
 =?utf-8?B?VFNaVzV6aW1PUHk1ZFBsaExCb1pvZlRJM0xVYkxISWswN1dCc3h6MEZJTmxM?=
 =?utf-8?B?QzhQMXh0eFFZUlVRa294R1ZWUi9qek1mT3lzRll6dktSM1JLbVpIMGJvS05R?=
 =?utf-8?B?YTNWTzIydDRqYXRFK1dxYVJtRk82VzlpMzUyb1BqLzlhUU9CejRQS01Tb2d1?=
 =?utf-8?B?a2l6UDRuVWFSUXpUa1RjL0dFZS9OTUNjS0NpVVQ0SWYxVWRTaUdYZFpGbWhW?=
 =?utf-8?B?QlFrblc1OG5qY05CTmROQmhzK2c2bythTURnVEd3NnlXUkhWbVNwRVl5T2gy?=
 =?utf-8?B?eEFjRWMzWkZiaHZTMENnd0RnREJYOFA2NXBzcnhKNEVQbDNHQlJFVzRqMXRL?=
 =?utf-8?B?WlpmU2NsTldDS0VRRjFvZlI5cmc3TkJORmZOYm1remxZb2FGWElJYkdoWVgw?=
 =?utf-8?B?UjdVQm1LeFFWdzV2K2J1d0xZU203TjlQWE51ZEZ2SVhSOFJpTDhmSmhFTXJN?=
 =?utf-8?Q?csORi3SxXbzFtLFyPYyJZhWRr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 898f6c3b-2aef-4c70-ba95-08dd70c3f5e9
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 02:21:50.5047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lbpwnDHxhgNOCByk78GrQ2i4PYNqfxx/RusptGUiPeWKQVm+vCUxeAZwpFCbPES4qfHzaRmT1FeEgk+/ngWow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6436


在 2025/4/1 09:50, Vishal Moola (Oracle) 写道:
> On Mon, Mar 31, 2025 at 10:05:53AM +0800, Huan Yang wrote:
>> HI Vishal,
>>
>> 在 2025/3/29 05:13, Vishal Moola (Oracle) 写道:
>>> Currently, users have to call vmap() or vmap_pfn() to map pages to
>>> kernel virtual space. vmap_pfn() is for special pages (i.e. pfns
>>> without struct page). vmap() handles normal pages.
>>>
>>> With large folios, we may want to map ranges that only span
>>> part of a folio (i.e. mapping half of a 2Mb folio).
>>> vmap_file() will allow us to do so.
>> You mention vmap_file can support range folio vmap, but when I look code, I can't figure out
>>
>> how to use, maybe I missed something? :)
> I took a look at the udma-buf code. Rather than iterating through the
> folios using pfns, you can calculate the corresponding file offsets
> (maybe you already have them?) to map the desired folios.

Currently udmabuf folio's not simple based on file(even each memory from memfd). User can provide

random range of memfd  to udmabuf to use. For example:

We get a memfd maybe 4M, user split it into [0, 2M), [1M, 2M), [2M, 4M), so you can see 1M-2M range repeat.

This range can gathered by udmabuf_create_list, then udmabuf use it. So, udmabuf record it by folio array+offset array.

I think vmap_file based on address_space's range can't help.

>
>> And this API still aim to file vmap, Maybe not suitable for the problem I mentioned in:
>>
>> https://lore.kernel.org/lkml/20250312061513.1126496-1-link@vivo.com/
> I'm not sure which problem you're referring to, could you be more
> specific?

1. udmabuf not same to file vmap usage

2. udmabuf can't use page struct if HVO hugetlb enabled and use.

It still need pfn based vmap or folio's offset based range vmap.(Or, just simple reject HVO folio use vmap) :)

>
>> Thanks,
>> Huan Yang
>>
>>> Create a function, vmap_file(), to map a specified range of a given
>>> file to kernel virtual space. vmap_file() is an in-kernel equivalent
>>> to mmap(), and can be useful for filesystems.
>>>
>>> ---
>>> v2:
>>>     - Reword cover letter to provide a clearer overview of the current
>>>     vmalloc APIs, and usefulness of vmap_file()
>>>     - EXPORT_SYMBOL_GPL() instead of EXPORT_SYMBOL()
>>>     - Provide support to partially map file folios
>>>     - Demote this to RFC while we look for users
>>> --
>>> I don't have a user for this function right now, but it will be
>>> useful as users start converting to using large folios. I'm just
>>> putting it out here for anyone that may find a use for it.
>>>
>>> This seems like the sensible way to implement it, but I'm open
>>> to tweaking the functions semantics.
>>>
>>> I've Cc-ed a couple people that mentioned they might be interested
>>> in using it.
>>>
>>> Vishal Moola (Oracle) (1):
>>>     mm/vmalloc: Introduce vmap_file()
>>>
>>>    include/linux/vmalloc.h |   2 +
>>>    mm/vmalloc.c            | 113 ++++++++++++++++++++++++++++++++++++++++
>>>    2 files changed, 115 insertions(+)
>>>
