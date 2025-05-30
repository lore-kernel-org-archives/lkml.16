Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2086.outbound.protection.outlook.com [40.107.249.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333CB1B0424
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.86
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748596532; cv=fail; b=siFwWeTgIS3wLHAp+0bnIqRAKoU1BQqQZ6rXb0FmoAG0rpKhi7HBDIKnuCHIvMyk3mY6wq7YKzjnA4Ozev2+CUSNxBZIgoArkDSB2wqCBznGvtH0+CMfeQSFPlJRTTZfDHjAbRPG2+EO2PxUiM5danc7rHQ6IT5Vtcpu6kMW8lY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748596532; c=relaxed/simple;
	bh=Qy35vRDNo1o34aeArtrynZhzbdYsYKGOmniehb2NUxY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k1ofVUyWbExwqYqQ7xYBeWmfiO0WZFLcvVgW8q+AncRSy4THl6AWuF7ykFb/bSyB3RLrd/A0gQbi9Ru8hLwFIkYnNa4ROd2b6HgaBSm2MKSBXu7sMgooo97yMHmnMa/+eEBbVVTG6ox7uEY386mswfSegRB0i5l6AfyZmkv4KBc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nXNoqDvZ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nXNoqDvZ; arc=fail smtp.client-ip=40.107.249.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nXNoqDvZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nXNoqDvZ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dYA742EnvUMoA+AdBiYf8ua2VRRuF4qNLnun6xT6MqTdhcT0QUXq8QHkfq4k+AieVTgKdnqgk3VhT7O3hKi1d0+6XaYSIFZm7Ckub5d2LMIcqCRBS+azvJd9HzAJybwZbuo6e+zi+uSkoFz30AQPum/EgtYP443rKb0cGGjYPGYBuqOV62Tvb9pi1pq01DSXlQBwfIK8ny8k6bL2wh2EJSAOylBS5JFtN7wL+n9+He6M76WH3RRQfzeXMoFwbqSXXUekkV2ot84X3eGQzUkPRH3v0NSA7Hj/A05epjWh3jDdNzDmnzbUAuL4rtEngkVWL0laGQng10P+F5A5qWK9hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NYD8lIwEtkyeiGV2hg5zGeooAcj2uoDesyDxL28Vpc=;
 b=rJKec4mqLDvYAM968nxaU50oD+DEkL2hgd1N0XHHCf0LvufGbpdyDkLLjtSSJN+ecNNdEEQPPjnc4DXaE1Gwy3h0sNU7uMszeXumERXJTkf5+1Kwy6oU9V1nL/XAXE+RNkpjyEdJ9DUcM7rTubRdtVUW5+x0ZLYW8gEK+C8tC9OJCr9ZMXF8aHc7qYKZrcRokpzXAaHLEu9QIXZaYBrIZPE8B3Xpjgg1lzKgtllU2FmqKK/nZUaITZMBrjlVo5zpWLNoqdC8syfvR726QNKjYyrmLl0ghN3orhKx3cuzofJBbO9sRm7FVBj+z6EQNYDh2OVW8wXcaydISi/ADLPDYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NYD8lIwEtkyeiGV2hg5zGeooAcj2uoDesyDxL28Vpc=;
 b=nXNoqDvZ1/gQ+uCeGIakKLOY44V7l9Gv9Exf0OZkXi5atN8WVXOxwMMHKIo+K/fCS/diLMkg/uo1KhO/Z1eD+LOvjqckCj3vb6QpCVPP43BORe1Rb3/BrLu0Jw9ZTHxjsO6t1ipnl46SPHPiB2FWGtoa/1E3U0oFgB4XAKFE5fY=
Received: from AS4P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::17)
 by DU0PR08MB9439.eurprd08.prod.outlook.com (2603:10a6:10:42d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 09:15:25 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::5) by AS4P251CA0028.outlook.office365.com
 (2603:10a6:20b:5d3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Fri,
 30 May 2025 09:15:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Fri, 30 May 2025 09:15:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jL3VNaHe12SwJf0TD9EbnJmINdyf1dbLi+sr9HoPxAbl976UmpjbWcQGXoX/IW3gb+XmSbp0XU4MnmFZMghnPdczHjuWijKSiRYk/5SEtvMxxVZEA7alKGLxeBHU8fDFXxCZEmYW5pY11+3eRIlcaQnCQuCofNFuJ96JS7jQIFCJmw69jicAkG1hVXPU/5YeHRvfZ85nVRPdkQBiWbQHxbmmog3MjQYlmWuoQf4v2SPiGiA/C2F5P39gsJWMWPOPcT62jFrX4gicrl04um7vh5uBAbpTei5iXNH5rZ5CEtFQNTuwo2uzipiha+3KjxMRLUgr9+XBO25mIs3BwNQbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NYD8lIwEtkyeiGV2hg5zGeooAcj2uoDesyDxL28Vpc=;
 b=sKBqGKisdEl/jSYbjryeCvWz8UT/QJiQ61Dd15/53313077HtkyGLuYnYKAfBV1jG3RUKu976zdHKuUo+PBUioYu//aA6gWno77KZiylfWCCL5p/qgNxn3xxQz630NT3lsz2Z/8o3wdVBO5Qml7i7XNWu3ax3AaQq5pr822fJIx89uZziJAa6Tn/dpyD+4KGIrPktA1tV91hhjjyLDm92KpYrMEv3JbJGkdlY7dtLF7AOhugZgM+80MqB3ZMgHcLBf34QmIObxfErj9o0II1KOQttK7NVPN+u5OCAvgorCPKMsoVQb7Ok62xIg9RhS9YNcEovthHpjdZV3SF6Ls1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NYD8lIwEtkyeiGV2hg5zGeooAcj2uoDesyDxL28Vpc=;
 b=nXNoqDvZ1/gQ+uCeGIakKLOY44V7l9Gv9Exf0OZkXi5atN8WVXOxwMMHKIo+K/fCS/diLMkg/uo1KhO/Z1eD+LOvjqckCj3vb6QpCVPP43BORe1Rb3/BrLu0Jw9ZTHxjsO6t1ipnl46SPHPiB2FWGtoa/1E3U0oFgB4XAKFE5fY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB6503.eurprd08.prod.outlook.com (2603:10a6:20b:33b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 09:14:52 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 09:14:52 +0000
Message-ID: <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
Date: Fri, 30 May 2025 14:44:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB6503:EE_|AM2PEPF0001C716:EE_|DU0PR08MB9439:EE_
X-MS-Office365-Filtering-Correlation-Id: a393d67c-6e50-4528-b182-08dd9f5a8317
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NHR5Z2dxMDliQnVhUWxPOXJtU0krUlpML3c1dGIrd0VwSkRSci9UamJ0blNH?=
 =?utf-8?B?cVJYeDdwREUrTW1JMWd2Mm91cm5kbXdwSnVkbEppV3pTN29hK2VvQVV0bTZz?=
 =?utf-8?B?aUhONFJhN0RrU0pSSkt4K3BVWVB5eThMcnFCanRVeWpYVXRlRi94UHQ0d3hO?=
 =?utf-8?B?UDU3WTRQMTFYa2xjQlExSTBRNmVGS0xLOEhUak1jTGpQaWY3WjZWMXRhbDYw?=
 =?utf-8?B?SnhUaHpmZWRudE9VWkc5TlZLcWkrWEJJMnIzclJ6WW1kUDBGc0hRL3NWTzhy?=
 =?utf-8?B?RXBnL3VHOG1SNUhxblhrcHNmaDREdzBFZlFnc0twdGJxVms2aGdYVzI4VTZW?=
 =?utf-8?B?cVBkQ0FwUnpwYUdURDlONmhWa0xYV054cTQ5SDNtdk9ZOXpmVis4TEdJb09p?=
 =?utf-8?B?dTNpV3ZGOTFNeXl0dlBFR2kwYzdLcmJ6ekRodm42MEhUTXZNY0h4TjE2aGtF?=
 =?utf-8?B?L1Rlb0V5b0oxUVVsY2QwMzRHUHlWSHVYUDg0cHJNN1ZFS3pLc09KZjRiSGJH?=
 =?utf-8?B?cWdOOVg3b3pTb3B6VXUxa2xJYUJDaWpZbmlwNE9FUk1PMi9CSEJ4VmhMUDdT?=
 =?utf-8?B?cVFINEF3WWc2VUJRU0hiWmxwSFZiUFBab2o3dUxrMzhodDg0d1BETGlzR2tT?=
 =?utf-8?B?NHczcGozaG9oSHRaMU9qS052d2dxOWdKQ2hBbXJ3M2lkTCtNazExaUJTaUV5?=
 =?utf-8?B?VFNXbWQzS3haMTJ3bzVJK0NLdkRNQjRGM1E5QlE1RXEvL0dLUzRpdU4zSWhI?=
 =?utf-8?B?QVJDSWxrNzBGOXl4YndNSkNXMlU4bng3U3QvYW9JK25ieGsvNXR4WFd3NWhJ?=
 =?utf-8?B?Q1doOWlwelRKZ3lxZzZoN0dRenJQWUdYRldNUlJQQlhaKy9rdVBSODgvMjZy?=
 =?utf-8?B?VmZoNUxRalZlekwwdHp1dDZaTlJnRVpkMzFlRUg2WE1KbUFRc1MyRXBLQVg0?=
 =?utf-8?B?ZUxLVkFPUjF2NElMMlprU2prWTl0cDNzVEpVVUZzUHdFa0YyVytERlp5OGRC?=
 =?utf-8?B?K3g1akxXdnZBZExab3ZnVHZadGgyU0ZLUUZVR3U4WFNKZnFBTThOekpINnMz?=
 =?utf-8?B?cGl6TlRSTnQ4SEgzSERnTC9kTytLOWY0ZGF5ZVpBTkJ1c0NrMUNaTmc1dEh0?=
 =?utf-8?B?OEVhUlNaYkFTc2xlZ0hmWDJZSXd3K0V6Vm51Q3pSWTduNmNwd2U1S2xpL0xT?=
 =?utf-8?B?Mk01b2REbFp4VkJ5ellUb2tvb0w2NEF1aTVaczFCckRHcGl4VW1qWTc1MHhm?=
 =?utf-8?B?OWZKSmtSVmYraEdtd1BFazRQMUdvNmE4dklzTUM1Z25uaW5ISFQzSlRBQlIw?=
 =?utf-8?B?Qm1yU2NLV0g3S1VMelZ0bFJpNUh3UERjM0o4cU8zYVN6dCsrM3psT0V3UU1I?=
 =?utf-8?B?TndwYWRTdVprUVF3ZlpnNGwvSVpNMzRMNkZMell3S0hWeGhMMWZxRTJHV0ww?=
 =?utf-8?B?c3FncU03aWlUSk9JaHlyY3NXRWhGVWtyRmoyMzNsOVVCSGE1eFJ4NEZieUpz?=
 =?utf-8?B?VHlLbjluZ1o3MkFEQTAraHhraXl0RU0vdG01VWQ1cmZ6RDB1NHUyOUdGOTQ5?=
 =?utf-8?B?QUc4VWNpeTZPQ1ZqOFNTQnZqR3BUaytFbXdoUEZTcitGV0lBd3ozRXBBaDJw?=
 =?utf-8?B?WHREK2hMaUtGUHBYUjk0RG1zRDlaRmFkbnJxdSticnRoY2JVZUVoMGxGUDA1?=
 =?utf-8?B?bmpZSmdpOGVGMG1Kejg1ZVJra2o2RDM3Ri9EaEQ4aFNFWVZGYVNKTEZkcEVY?=
 =?utf-8?B?QW8rQ3JzYitCYlIvVFk0ZzljL1lzcmlocmVYRTI2MitJRWR5a1U3aVU1c2Ey?=
 =?utf-8?B?YWV0d3E3aURQeHBqRWNtT2FLQlJKQUFDbFFHMy9rT0M4d3FOL2M1ZzdEN2kw?=
 =?utf-8?B?MVZVejg1cVRMOU5JRmtJL1Fjb2lVbDJFOFV0THJtWmZoa2c9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f64290b3-6508-461d-3941-08dd9f5a6f72
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|376014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aS9mR3RFb2dYL0pJRXUrNjRCQ3EvbFI3RFF3dXh6M1JvdUxiY0R0ZmxYVG9h?=
 =?utf-8?B?VlNobEd0WnhlYXI3cTVDVkh4bG1QWURGOFNYVm9Nbm1JZFh4Mnd3YnBYaEkv?=
 =?utf-8?B?RFRXMFRBM042VTlyZEUvZVM4OExXa3c0OUpnSXBPckRPRHZ5Yko2cURRaVRo?=
 =?utf-8?B?K2dOUEFMMDUvQ3M1UU5ia29iZWJQYkdKSkg1QjZyVTUyRnNWTmYwNHg1Qmdn?=
 =?utf-8?B?N3Q0b3ZuNmRoT1liY0ExNGpVYklZVmhXUUtmMHB3eVNmeGx6a0p3QjVtaW1Z?=
 =?utf-8?B?Q3lEYXRqRmJFY1YwblYrTjVtMUIyUHNhSHdQTy90Vnllb3BLR0liWE1ZdEtx?=
 =?utf-8?B?bDF2NmtnbHhmUG1mNUpicllibEVMOTN3a3E3Y2lxWUFMVjhQZUtIMm5vWkR3?=
 =?utf-8?B?aENDY2tEWFVQTGxjdENJY25BY3RyaWRQSkpOYzIyUG9kNlV2U2hwL0cxVm9p?=
 =?utf-8?B?dmdZMWc2RG50cHExQTJXWVVnSDdJd1FadDNmQ1BDSEU1bDE1VGtWYmtKdnhw?=
 =?utf-8?B?M01GTTZDdHhxN09hRHVDZnpHbzZLendrcGxaQktwTEYybGlSMDZlZE5GV2FF?=
 =?utf-8?B?M1VsTVZuemdIajg4S1RyVHIrKzhUR3VIQlE0TW1BK25SYXJnRW1IWlViSURK?=
 =?utf-8?B?SDgvNm1WRDA5ZXVLZXIwb2ZDVU9GN2Vyc0hOb2EwclZ4eUZRQWt3QkpCYkps?=
 =?utf-8?B?MEZsSjhaWVFXenRhcXMzc1dTaTdqSmFWZUFmWkpndjJ5WDFTQkNQY3JGYTIw?=
 =?utf-8?B?eUhhZUZGZnVXNUI3TW5sUzdtcGRqK0pjUG5WRzdVTlVKUEI0emIrQ285eGk0?=
 =?utf-8?B?Z2lVWHZOZTdJVEpwdjdKaHhJNTFsRjRjQktZbWYrUnNuZU00cktlZFZQMVVl?=
 =?utf-8?B?cDFObE9iSEpKUmE0REpCZ1pQc1ZyTDEzU2IwbGpZL3g2Y0dPSEl1RWNKT1pk?=
 =?utf-8?B?N2wrWGJkejg5MmRXaktjTERrZGJNZGl4TnlYeVhqMXFYaTcyOUVHRUNPYUdC?=
 =?utf-8?B?ZzZJL0NyRTl5TURWMmhwZ0YwNFhSQlkyQ3ZMN1JzTWh6RG52bTdKMjRqYjRs?=
 =?utf-8?B?c2xxZGRRdndCamIyQnM2d29peHZkRkhTS284RStnZjY0aTFFL3BTdVdMNmxE?=
 =?utf-8?B?TUlvOXRJcjRVZGJ0cXVnblZqZ3Z0TWQ0ZDdJUzJJa0l4cmhveGJoVTk2YTJ2?=
 =?utf-8?B?OXloRkU2TVUvODhQU3VtWWNlN2xwNkhUZElVcXZwaHY2cjhOcVVPMzA3aS9Y?=
 =?utf-8?B?US82SjY2SWhkRSszVHJ6b01QTWhieUdpRzBQYWo4MGt5TVJ2cFdnVFJYUjNl?=
 =?utf-8?B?VzFYeVRBSWV1b0daTWI1MjBleTkyTFR0OTZHMmZJVmFBRmdIbnJmbUsxaGh6?=
 =?utf-8?B?cVBBR1E5SXNhZzFnbW9uejd2R3QwdUpkaVdxbkM2ZkxoQktFYUdldGxYaWs1?=
 =?utf-8?B?NjdRM09mWWZaYVdhbzUrNHFFTndsRWJLZ2tZbUhoaUxHMXhCVVA3QUVKdHVH?=
 =?utf-8?B?eFVDR0pHNjNnMHphL2xheHBPT0dJWGsxK0JraTVFQmd6NWpUbGJiUGQ1eHA2?=
 =?utf-8?B?UHZQNGwzMEVXVnVEZDBPRjhwNHVKdXVaTXoweHovY3JXRVZPaCsrR3l5K0E4?=
 =?utf-8?B?Wm5tTE1CZS9WNWxKM1F1NGozQzNIaEJMRVVHQ1Jzc3BuZ0NIMUovazcxMkZM?=
 =?utf-8?B?YndTRnovbGVQNkhMU1RRQURkNExPdVU0VnM1bHVJcldGbVNraFRaYXBNV2NW?=
 =?utf-8?B?VHUreW56VURhaWhKd0x3SVFSMUNpZFJ5dTBaS3dycXBkZWZJUXQxci9DdXVE?=
 =?utf-8?B?Qk82R280NE00Q1ltSW9qTW5mTmt5MW14aGxjc1dWd2tWNFBKb2Z6dytodVlq?=
 =?utf-8?B?SHphS0V2RHk1LzNIZHgyK1BJWlptODRRWms2dnQ2dHMxSEJReVhNNWtrdzhC?=
 =?utf-8?B?d0M0NmJQWTBndnZ6QmthM3REZEhxcGNlWE9wbUNoakRpdHRRMWN4elhaMFZm?=
 =?utf-8?B?ZkJsRDZycjZSQURnMjJtbG42Mktia0dJZ0J4dnkvTnRwUGhtWkF2WEhoazNW?=
 =?utf-8?Q?S5Ocb9?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(376014)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 09:15:25.0729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a393d67c-6e50-4528-b182-08dd9f5a8317
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9439


On 30/05/25 2:10 pm, Ryan Roberts wrote:
> On 30/05/2025 09:20, Dev Jain wrote:
>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>> because an intermediate table may be removed, potentially causing the
>> ptdump code to dereference an invalid address. We want to be able to
>> analyze block vs page mappings for kernel mappings with ptdump, so to
>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>> use mmap_read_lock and not write lock because we don't need to synchronize
>> between two different vm_structs; two vmalloc objects running this same
>> code path will point to different page tables, hence there is no race.

My "correction" from race->no problem was incorrect after all :) There will
be no race too since the vm_struct object has exclusive access to whatever
table it is clearing.

>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/include/asm/vmalloc.h | 6 ++----
>>   arch/arm64/mm/mmu.c              | 7 +++++++
>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>> index 38fafffe699f..28b7173d8693 100644
>> --- a/arch/arm64/include/asm/vmalloc.h
>> +++ b/arch/arm64/include/asm/vmalloc.h
>> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>>   	/*
>>   	 * SW table walks can't handle removal of intermediate entries.
>>   	 */
>> -	return pud_sect_supported() &&
>> -	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>> +	return pud_sect_supported();
>>   }
>>   
>>   #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>>   static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>   {
>> -	/* See arch_vmap_pud_supported() */
>> -	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>> +	return true;
>>   }
>>   
>>   #endif
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index ea6695d53fb9..798cebd9e147 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>   	}
>>   
>>   	table = pte_offset_kernel(pmdp, addr);
>> +
>> +	/* Synchronize against ptdump_walk_pgd() */
>> +	mmap_read_lock(&init_mm);
>>   	pmd_clear(pmdp);
>> +	mmap_read_unlock(&init_mm);
> So this works because ptdump_walk_pgd() takes the write_lock (which is mutually
> exclusive with any read_lock holders) for the duration of the table walk, so it
> will either consistently see the pgtables before or after this removal. It will
> never disappear during the walk, correct?
>
> I guess there is a risk of this showing up as contention with other init_mm
> write_lock holders. But I expect that pmd_free_pte_page()/pud_free_pmd_page()
> are called sufficiently rarely that the risk is very small. Let's fix any perf
> problem if/when we see it.

We can avoid all of that by my initial approach - to wrap the lock around CONFIG_PTDUMP_DEBUGFS.
I don't have a strong opinion, just putting it out there.

>
>>   	__flush_tlb_kernel_pgtable(addr);
> And the tlbi doesn't need to be serialized because there is no security issue.
> The walker can be trusted to only dereference memory that it sees as it walks
> the pgtable (obviously).
>
>>   	pte_free_kernel(NULL, table);
>>   	return 1;
>> @@ -1289,7 +1293,10 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>   		pmd_free_pte_page(pmdp, next);
>>   	} while (pmdp++, next += PMD_SIZE, next != end);
>>   
>> +	/* Synchronize against ptdump_walk_pgd() */
>> +	mmap_read_lock(&init_mm);
>>   	pud_clear(pudp);
>> +	mmap_read_unlock(&init_mm);
> Hmm, so pud_free_pmd_page() is now going to cause us to acquire and release the
> (upto) lock 513 times (for a 4K kernel). I wonder if there is an argument for
> clearing the pud first (under the lock), then the pmds can all be cleared
> without a lock, since the walker won't be able to see the pmds once the pud is
> cleared.

Yes, we can isolate the PMD table in case the caller of pmd_free_pte_page is
pud_free_pmd_page. In this case, vm_struct_1 has exclusive access to the entire
pmd page, hence no race will occur. But, in case of vmap_try_huge_pmd() being the
caller, we cannot drop the locks around pmd_free_pte_page. So we can have something
like

#ifdef CONFIG_PTDUMP_DEBUGFS
static inline void ptdump_synchronize_lock(bool flag)
{
	if (flag)
		mmap_read_lock(&init_mm);
}

and pass false when the caller is pud_free_pmd_page.

>
> Thanks,
> Ryan
>
>>   	__flush_tlb_kernel_pgtable(addr);
>>   	pmd_free(NULL, table);
>>   	return 1;
