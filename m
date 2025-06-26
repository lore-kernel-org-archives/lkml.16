Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11020097.outbound.protection.outlook.com [52.101.193.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B805479B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750972133; cv=fail; b=U17N5+p50jrisV8s4EWlm2bkyCN9NLTmhdOKVGvAQmTjunP+SyR8d0MsJEXbeoizXEUxkeJrotiGeE1g/QGEvjuZAKfWoCs4KLLf0BTJ/VFWCG2xqWvlWoanZ12CvC/8qM3eZjLghGV9UOEKkrK+7h7PWmTOBG0GZGlyGf3WLko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750972133; c=relaxed/simple;
	bh=HCY8s7xHM+QY1cbZIz0nK+p8Ate+vguuCKo+Q9+/8Uc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mjzVD4QneUtu0cJi0ve59LmSJtGE9hYpR/rHxv3p5CLMApvELdt0Vg2+N6owQ3lnL7cxb2hY1myMxOoLk6K3VI5+qZehIZi9b6TBLrsBHoZc6jX1gp5CTYHhmHeKef5WAq8O6l89e7lVED7LhfP+g8AfKqBJGtBGktYiMaqeqdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=kJiWsmQu; arc=fail smtp.client-ip=52.101.193.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="kJiWsmQu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryeFO9T6CWslcCDEXkOcPgCVWSRwYLAqy4WRScDuTGfdGnolNa2/SLfZXUcnN7okIIqCebScGOyITV0/UdOrwQWYrLQsVO1mNFk+FJr/1CASi8nsdp4FqWIV1Rxd99Te/+OFbAUiwIK0bBW5fL0ihQxmJoxkMUilEiwFZW7MQy0bGoZ1JLcg0PKmHjJCpfMWYUO+hX7cFuE/dJGOSBvkNCaU48XmGK9+y0LVsDggcZ6g/fDUZrhXTQOMnql2DF41Yay0nOkkvFZVHKuqQL+Cwf3i95T/s73mtAjqKGjbv9dnlhSbgVBsAo8dq65zosJ12MUoyPCF7gpIJaJF0l9SJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7/3TJ+z8DvU3DpJ/qCpodJeo8lUF0RQtRlOpJMIcQc=;
 b=Md9UUzlEAOWCz6PFrLhdbBve0e1tlxkKIaTXNjpeB/t+AxcQbDsubLqHoZBngyCuiF//inXTzIYGlKUjRBpvqnMzgV890jZakjZsZ4dM38OXXcktnOIaG5KxtoOJKwlOMAf5T6MI/erGyeMSfNOckyDXlX6v1huk//6OaKyhoQ6cpY3paILvydlY+97yL3JMEHckNUwFC0ru4yrLLfhzOrqAU4yXFQJePeH4cBWygIjCPbPwad3XafMuKYmzyI2scm0JbEpU1Bf1QZm/HKi/aOzanB7VMuNRXWP/yx7UiJ//hAX5LWgF6jn4wr7ipgApTOs0UMa24U1w1SrvOlg+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7/3TJ+z8DvU3DpJ/qCpodJeo8lUF0RQtRlOpJMIcQc=;
 b=kJiWsmQugBrbQsexbEzKtNTVfkFzRDZytRFkaK3VXEPJy2/1QfjUghBwXJUVd0pjlrNh7VgFldcDTt0LYrutGFMSuiuq4jEqx3SmreaJe1x70TOblxCybwHl6/LwXJJDDrmbiy5iDXyux7o4esWBBhMVrHsmYXv+JICcWZrzJlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SJ2PR01MB8348.prod.exchangelabs.com (2603:10b6:a03:53b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.21; Thu, 26 Jun 2025 21:08:46 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%4]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 21:08:45 +0000
Message-ID: <970c5885-8a06-438e-b626-e6640f9322f5@os.amperecomputing.com>
Date: Thu, 26 Jun 2025 14:08:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
To: Ryan Roberts <ryan.roberts@arm.com>, Mike Rapoport <rppt@kernel.org>,
 Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com> <aE53Jp7ZGgTxtxwG@kernel.org>
 <956f6ebe-606f-4575-a0a5-7841c95b5371@arm.com>
 <cab45bd6-8108-4a6f-816a-3f7b70a2902f@os.amperecomputing.com>
 <b0ef3756-2cd2-41d7-b757-0518332e1b54@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <b0ef3756-2cd2-41d7-b757-0518332e1b54@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::20) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SJ2PR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: fe73e060-92ee-4671-3108-08ddb4f5a33d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGkxR2dGZHIva1pNU0cyZk1RUTdmY0xXczh2NzAwbkZnRldNTytSVjVGV2xP?=
 =?utf-8?B?VmkwUHdWOFJ0K0VPN3p2OHovdGttUmdzTUx4NGdOU0NmcktuT29nM3pyVHBa?=
 =?utf-8?B?UktqMitCYVpXeXpqR0d2bTFKbCtrNUhaT294SEM0VzdaRHNGd1lzUVpaK2tD?=
 =?utf-8?B?dUl1ZURrMGFuZTd2dERlS0t3MjlaSTlQbUIyZFdSZUx3TmpweUlWd0loYkhO?=
 =?utf-8?B?QlRWMGR6Q2dicnBRbytoelAvNXVEZ0FtaDhBMVNpcS9SY1NoR0RHTUZCUk81?=
 =?utf-8?B?WEJFVHhwV3dSbStqUmRXQ2hVS01BOCs0MVBMSkUzWmRPZW5Jd25vVVJ0Qmpu?=
 =?utf-8?B?dFo0akNQckE3Y1VWeWtMY0VwaCtTUUYrOUtDRjVwSHpGSW5lWnRsMFoyeVRR?=
 =?utf-8?B?c0pzUUZLaWxTb0draS9nZy9JMEZZY1FUcjc0RVFHVFNrbG85aGZuVC9XaWJU?=
 =?utf-8?B?RmxYUTM2Q29RVFZ2aDBEcWxiN09xaWIydUJlRDdra1NveUxHdDF4LzQwam9L?=
 =?utf-8?B?Z1hadm9NM1FIWXV2Y0I3OVFEYTB1cGUwbTZScDZhRldjOVJvOTdKSHp0dktr?=
 =?utf-8?B?QXZ6QWVuYnYvWElBSXFQOGZobWtjY3p1VmhyY25ReGwrTDlKRlU0OGtLNWZY?=
 =?utf-8?B?ZEZaZ3I0akRlL3R0L1dYdE9rV1BhNDRDY3h4SDhUWnh6VmZZcUJIdkJaQlNW?=
 =?utf-8?B?NVdHMkNsYUhGVW5PMkhlNlRVeGVXS1R3OGRXZUVTa1A0MXNDNUFzM290d0hW?=
 =?utf-8?B?d2J3OHVKMG1aZU5iZEk2RVFqcGVUaVFMb3kxQVZjQms2bEc0UWZzR3VsQjlN?=
 =?utf-8?B?Y1RKY09GRGRpMEhDRlVqWWY5QVl4SFRQYm51VDZPTFFldDZHTHRQUDhiQ29w?=
 =?utf-8?B?cEM0TkpHNzB1UDY2bG5WWGdDUFdiWkVPVlNtQXdPL0V0VUgyWUg2d0RzcnQ4?=
 =?utf-8?B?d0s4QjRsSDFsdFUweUMrYloyV3dNWE03ZGtsaFh3bElRYThvc2pwZmFpckFM?=
 =?utf-8?B?MmxLMjRzTEJSYXpxTUJVTWVQOFRtbEh3RTJwTHBnL2M1YzlxSGVaaVlDSWNl?=
 =?utf-8?B?b0dZQ3ZyWUZLYjdUVjRJak1XY2RHNExFUi9GTlg4U2dQMGd3N2E2TFBtOGxh?=
 =?utf-8?B?ZkpUNEF5NVA0RUFoaVdJLzc3cEZnbyswai92MW5DTU1lTVNBZmJaNGQ0NlN4?=
 =?utf-8?B?UmVQdUxoYkpKSXJjd2svc1VRQmM4aEV1S3dxMU1XZ2tpVklPbVhPai9xMk5E?=
 =?utf-8?B?dDV4U3JXZHVZcHNrelhqSXZlVGFDbnd4dkZJM3RrdVY0eWJ5QXpHaEZaMGxN?=
 =?utf-8?B?WHpFMlhCbElLVDl2aFJwdkNYV25rS2plTlBwLytsSU1XL3J2N0lsaWRCcGkr?=
 =?utf-8?B?M3JVaTJmMi9QMEloc0tHZGs4cVk2Z0NjaFZOckJkWTdwQTdNTU9DSUFmaWZh?=
 =?utf-8?B?V2hmRkRzWDlNMEkweDRkOUhlMDFsamM1cjdjLzVyWWJaWERlYmx5OHVEMnRQ?=
 =?utf-8?B?c0oyK29XQmo4djVnMzllOVpVU1ZNeU1QVXFvYWpKeUtycnc1aEVPR3c3ellq?=
 =?utf-8?B?MFA3NDN6WWg2THNQbDVWU0NhY05WbDlXSVVxTUJLSUxWMkdVL1BYQVY2RW42?=
 =?utf-8?B?SEFVQ09SZEZ2bFBCYmpKNlUyS1c0ZmFhNHJWYkZIMG5SYWtPVVVENncxTXpF?=
 =?utf-8?B?cXVFQUxoS0lINlExN045eDRuK2piY21qM1lKTU5rRmtIdS8xTFJNR1FLdzYw?=
 =?utf-8?B?ajB1YUozNk14Y0pqcWNrRHVCYmYvczBFMWk3K2ttNlFnL1A4clpqeHc1NVdx?=
 =?utf-8?B?M2t6VFQvVG9sL2o1dTdBR041REFKR016MGl4NUpqdkZGaHpucWgrejJTSEw3?=
 =?utf-8?B?RFpnaElXVndQZHI1QTBNZnNwdmpYNjlCQXR3QjFERTlndDZmUUtxRWRTd0lu?=
 =?utf-8?Q?DH7oCSXHlWs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2E3TkFlc1lvcXpqUGVqLytzUkVXY0RYcmtXZWhwU3I3K2Zkc0ZnMWE1bDQ3?=
 =?utf-8?B?aDFXZG1GeHl4aFZ6NWZteW51eW5lQ0g5UGduL1BxWFVJaEJKYmZDaUF0N1dr?=
 =?utf-8?B?bHNHZjhGNHdZK2JqbXM5QktVR0pkZFRwNzVBeUc4cFVZOTd6bkNEZnRtaW9m?=
 =?utf-8?B?N2lVWHdUR1UzYjFnNjVSNG5FcHQvOFQ0WGc0Y3RGYWJ1emM5NHB0N2dGN29V?=
 =?utf-8?B?ajlWSjRIY2NDQmVjLzNuSVVlNVZ1QVNFTHV4TTRxTVh4dFNrcGtEeXFFOXJE?=
 =?utf-8?B?M3FFaWlTeks0ZHBkdTRXQVcyVW9DS1E0US9ZUnNWVk81VmJPbS9QWGg5RnZi?=
 =?utf-8?B?NjhWcVhSTmx5QnlxMmlwNHRvTGVmT0lEL1FrN3NuRCt3eUVPQlduTXNEWjgv?=
 =?utf-8?B?TWxEUU9scm1XR0lQTGRuTTNJM0xTdmJOL2xMTE9EdnVyK2ZNWWxKNWVES0Vs?=
 =?utf-8?B?S2I4c3BDRSszL1EwUXk1aDBIQXVkQUswSzh0RGtLdzlKcE1RQ2F1c1lINGxh?=
 =?utf-8?B?aytlak9ZUzVQQVFxSEpnYkc5QTE1UlVmYWNTWkVUUTJhTEJkRVBMd1FIVUIv?=
 =?utf-8?B?UW90K2xqdUw4cmRVanBIckVDTEI4UWYwNFdsdkc2MUZqemlUemdlMFdDblM0?=
 =?utf-8?B?U0g1bm1GVHcvL2hJU2JRTG5JbGNxVWZ2MDNEWHRtZHo0NHhmcTRiaGdraG9S?=
 =?utf-8?B?clVaMnY4dkcxWUtLVW84YSs3RTR4YWU2TXJHOWRjb015NENHRnNTMk9taUlz?=
 =?utf-8?B?T1c3T1MwcEVUY0Z6bmUxb3hlL0c4dFZYZ01DcjlpWDhlSERjTWVTOGwyZ2xC?=
 =?utf-8?B?bVMvdGxOWDVsa1U2RmNCaXlYMFlxYnIzYnhkaERjWUE2Y2xZZ2dWQVh6S1hy?=
 =?utf-8?B?V3F5NW9rT3RscGR4RjBKQ2JpU21DM0NrK1B2MWUwdW1ZMlFOWFhJejZNYk5Y?=
 =?utf-8?B?YllRSDZkMXhKcXIzdGJMQWg3NmdnMHRsK01MR0dUT2h4bGZHN0RLQjlscUZL?=
 =?utf-8?B?MXFLbW5DRWszeEdNWmhBYzNvOWQ2dWgwcHFWb0Q2WHFiOGFOYWZuTTBaUHFa?=
 =?utf-8?B?ak9OM1JNNFNicCtlcDdlbE5xTm5FUGFZK0VvaEFXWjVLUmdDa1ExbjFNczhs?=
 =?utf-8?B?TzhnMlFEdE1IV0pUSWRWNlFLUUg0a0dHa1FNTjczQU0zN3hrNnMwRTg1NGtB?=
 =?utf-8?B?bjJSTlVRMEJwSy9XeDBRdjZHeHIwZGNiVjVlb0tRRHBnb0pucTJuTlhIdU5a?=
 =?utf-8?B?M0lXbFZMRVY5VWlCbithYlZZNmxaWC8wT0dJWnMvQmRmc1ZLYUtMcFp3MkRu?=
 =?utf-8?B?R2dZWlpZY2poU2R1VUR4TStiRGdPN0Z5WlVaM0d4WVpTaWUyMmxsSTU3NXd5?=
 =?utf-8?B?OFZCRjNsMUwrZWFWa1d3cFg2d2VMbjRTbUs5N2NlK2doUnVYcXVETVVteloz?=
 =?utf-8?B?cmhIdzBVaWdQSDdhK0k0dUQvSENacE5UZ2FmVCt5bXAxNlRVbzFhbkE5WEpS?=
 =?utf-8?B?d0lLdHhRQUdtMTZpL2U3WkkzOGRTMEViQzZWVVlKS1NCY3ZEK01HUjZZb0Fu?=
 =?utf-8?B?cHBHQTg5VWJHc1MzbitzUmpLemNlRjg4Y2hVRytOR0tlbWRJTnJNRFdndUNK?=
 =?utf-8?B?dEZCWXQ3MDFubm5ERjNpTHFSNEsvaGxwajNTcHBCRnpjZkphcll2Z3hiYUV3?=
 =?utf-8?B?aVI4bzVGeU5CV0FFOU1ZdzhpTTRpV25tY2I2RzVXWVlNK1Uvc21HVlJhbmlj?=
 =?utf-8?B?MTVxUmVsRXRwSWFLSDgxUUI1dmQ0Mk9SME4ydldKRjl4eTFPUktQdjlUdGl3?=
 =?utf-8?B?M2g4ek9XanZUZkw0aGxORkhJSVhyNm9ZdHNaaEtmd1hjazZUVWtQdmRDUko0?=
 =?utf-8?B?ZWszYlBCMGY3VlZpdk90U2JldC9tcE9UdkJ5cGhLY05MMkx4aEorVzFsSUlp?=
 =?utf-8?B?UkZ1d0pRTjRweXBlOVJKZk02T0phV21mMmtENEtDTkJhSUE0ZjZ5ZFFwMEk2?=
 =?utf-8?B?cUwyemk1K0MzVVdpSmRSVW1Tb3FqOExTTUFDd1hmVHp1TG9EajNwcTdrcFBo?=
 =?utf-8?B?cFgzK2duU0d0N1VLL29VNERhd09ISmw1WENmNDZDNHlvVE1JVkdEWElJQ3ha?=
 =?utf-8?B?Q3JtR3RzMkRDLzZkUE5vOTUyeU5hWGF6YUNCZDdXbmxiTXYvWElTWVdGUEE2?=
 =?utf-8?Q?H723+FKYZDwnUclmRWkuHgg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe73e060-92ee-4671-3108-08ddb4f5a33d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 21:08:45.7247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxCAyg17iL12z63JABQSKqX+Hy5IpPHHNASkRHZwqTdDmfmCjjnkz2gFEsONjIwE/hShv3NBAOKLUHofQpjVvKaGOM/fyjBtWCwLM8B9Z6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8348



On 6/26/25 1:47 AM, Ryan Roberts wrote:
> On 25/06/2025 21:40, Yang Shi wrote:
>>
>> On 6/25/25 4:04 AM, Ryan Roberts wrote:
>>> On 15/06/2025 08:32, Mike Rapoport wrote:
>>>> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
>>>>> -/*
>>>>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>>>>> - */
>>>>> -static int __change_memory_common(unsigned long start, unsigned long size,
>>>>> +static int ___change_memory_common(unsigned long start, unsigned long size,
>>>>>                    pgprot_t set_mask, pgprot_t clear_mask)
>>>>>    {
>>>>>        struct page_change_data data;
>>>>> @@ -61,9 +140,28 @@ static int __change_memory_common(unsigned long start,
>>>>> unsigned long size,
>>>>>        data.set_mask = set_mask;
>>>>>        data.clear_mask = clear_mask;
>>>>>    -    ret = apply_to_page_range(&init_mm, start, size, change_page_range,
>>>>> -                    &data);
>>>>> +    arch_enter_lazy_mmu_mode();
>>>>> +
>>>>> +    /*
>>>>> +     * The caller must ensure that the range we are operating on does not
>>>>> +     * partially overlap a block mapping. Any such case should either not
>>>>> +     * exist, or must be eliminated by splitting the mapping - which for
>>>>> +     * kernel mappings can be done only on BBML2 systems.
>>>>> +     *
>>>>> +     */
>>>>> +    ret = walk_kernel_page_table_range_lockless(start, start + size,
>>>>> +                            &pageattr_ops, NULL, &data);
>>>> x86 has a cpa_lock for set_memory/set_direct_map to ensure that there's on
>>>> concurrency in kernel page table updates. I think arm64 has to have such
>>>> lock as well.
>>> We don't have a lock today, using apply_to_page_range(); we are expecting that
>>> the caller has exclusive ownership of the portion of virtual memory - i.e. the
>>> vmalloc region or linear map. So I don't think this patch changes that
>>> requirement?
>>>
>>> Where it does get a bit more hairy is when we introduce the support for
>>> splitting. In that case, 2 non-overlapping areas of virtual memory may share a
>>> large leaf mapping that needs to be split. But I've been discussing that with
>>> Yang Shi at [1] and I think we can handle that locklessly too.
>> If the split is serialized by a lock, changing permission can be lockless. But
>> if split is lockless, changing permission may be a little bit tricky,
>> particularly for CONT mappings. The implementation in my split patch assumes the
>> whole range has cont bit cleared if the first PTE in the range has cont bit
>> cleared because the lock guarantees two concurrent splits are serialized.
>>
>> But lockless split may trigger the below race:
>>
>> CPU A is splitting the page table, CPU B is changing the permission for one PTE
>> entry in the same table. Clearing cont bit is RMW, changing permission is RMW
>> too, but neither of them is atomic.
>>
>>                 CPU A                                      CPU B
>> read the PTE read the PTE
>> clear the cont bit for the PTE
>>                                     change the PTE permission from RW to RO
>>                                     store the new PTE
>>
>> store the new PTE <- it will overwrite the PTE value stored by CPU B and result
>> in misprogrammed cont PTEs
> Ahh yes, good point! I missed that. When I was thinking about this, I had
> assumed that *both* CPUs racing to split would (non-atomically) RMW to remove
> the cont bit on the whole block. That is safe as long as nothing else in the PTE
> changes. But of course you're right that the first one to complete that may then
> go on to modify the permissions in their portion of the now-split VA space. So
> there is definitely a problem.
>
>>
>> We should need do one the of the follows to avoid the race off the top of my head:
>> 1. Serialize the split with a lock
> I guess this is certainly the simplest as per your original proposal.

Yeah

>
>> 2. Make page table RMW atomic in both split and permission change
> I don't think we would need atomic RMW for the permission change - we would only
> need it for removing the cont bit? My reasoning is that by the time a thread is
> doing the permission change it must have already finished splitting the cont
> block. The permission change will only be for PTEs that we know we have
> exclusive access too. The other CPU may still be "splitting" the cont block, but
> since we already won, it will just be reading the PTEs and noticing that cont is
> already clear? I guess split_contpte()/split_contpmd() becomes a loop doing
> READ_ONCE() to test if the bit is set, followed by atomic bit clear if it was
> set (avoid the atomic where we can)?
>
>> 3. Check whether PTE is cont or not for every PTEs in the range instead of the
>> first PTE, before clearing cont bit if they are
> Ahh perhaps this is what I'm actually describing above?

Yes

>
>> 4. Retry if cont bit is not cleared in permission change, but we need
>> distinguish this from changing permission for the whole CONT PTE range because
>> we keep cont bit for this case
> I'd prefer to keep the splitting decoupled from the permission change if we can.

I agree.

>
>
> Personally, I'd prefer to take the lockless approach. I think it has the least
> chance of contention issues. But if you prefer to use a lock, then I'm ok with
> that as a starting point. I'd prefer to use a new separate lock though (like x86
> does) rather than risking extra contention with the init_mm PTL.

A separate lock is fine to me. I think it will make our life easier to 
use a lock. We can always optimize it if the lock contention turns out 
to be a problem.

Thanks,
Yang

>
> Thanks,
> Ryan
>
>
>> Thanks,
>> Yang
>>
>>> Perhaps I'm misunderstanding something?
>>>
>>> [1] https://lore.kernel.org/all/f036acea-1bd1-48a7-8600-75ddd504b8db@arm.com/
>>>
>>> Thanks,
>>> Ryan
>>>
>>>>> +    arch_leave_lazy_mmu_mode();
>>>>> +
>>>>> +    return ret;
>>>>> +}

