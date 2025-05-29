Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2110.outbound.protection.outlook.com [40.107.92.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670BC1632C8
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748540135; cv=fail; b=DDgA8XWdqXzlxh6oWXbzC5+ZKwlk6jznwLqi+wueFQ80T9N1cwmosJaISfdnQ5OErhOwIPaaqtLDEChKdn6caOA6yFHbg1zljN6EmA0hkiURSSbyi3nFSOkFzuuJZY6YKWe4DegKsLwhSSbDibyqbTLztNSI1h/iOjnWKj4oZ9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748540135; c=relaxed/simple;
	bh=pN/w8yLMexOUTHn43HGFvxsGxnt4DGa6Cmt9cE2jk0U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d20TdWSRm79t4Q3xsWwYqzV4BbXvB+oEVFQiT7tB7Qu2mxuTp3qEHh2OyEW99UziH8XHU1591p9W7uS92HmOa5uisBAc2Eomn3I4ETWP28f43pa7EpnrUIrgg1WHIhVpLogIUNN89DGgnJv5PfQlc7mNSvvYjOAOwKnUsXBi97o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=IFE+Z5TM; arc=fail smtp.client-ip=40.107.92.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="IFE+Z5TM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fg8lLJKfqwlaTHd29U0NOD4z90DzxASsnI7PgV8oBoX2ZL0vdLLX2vKfVB212FEVjsB7l9wREM68M6bwHtVp29oGD9l8jS2doHWTPCroR8FhLkNPiULksNlmVUdNvE4OJPyJQC+4HHAIt9CMzyrln4CCtOYW4qymRLX3ZG39YAg6MbhFzrSdYo7El8vc4OuAkKFCwIFrHtbgguHfwBid/ufVQtjqopO4rr/K7g5XirBG/HLuQPA9NNQFzQu1n3scQUdMwIJKgGHRuoUeB0LnXxcEtgGTlCHDM9KvotH9IhflFuDFI5Qs9ckxZi3NuEZv3gp+uTZrqQgOqD9YG8aZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOkdj+BspHxWMQEnHLUUXu4lL5lLu5VQmeh3az8Jrn8=;
 b=gq3PuwJmJqWTmWri69kUnJsZuJrQct5NWXUDMqeSvsN9jiMy7aWTOoKRCbK0nYvoOS8e4ZhbpqHtITIpmKWMN5zkkHzNBjZ60+mlEc6TtQCqoJQqxyd6sItmFaPd5m2qwlP5iPtfjzKzfkwme3tdPEvYIpzhCc2ZDY5fxNPUpxYJo1h5Yn/ST6g+LKbHhqaT8RidGE8UXPC089JhP+2CAP3hcp8fw60QJynGSAysGoLCFuRbLmRM4tIw7RoSaHjnjRY6V4ooht2hwYDtffLlqumiV/VZIgUTI9+n4+7kFJ1N4m4yCyBsAvl0mvMjV40WvltWx14Ybrr7To/zxWIw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOkdj+BspHxWMQEnHLUUXu4lL5lLu5VQmeh3az8Jrn8=;
 b=IFE+Z5TMdb7u4Lpl+pcOY6JGJUkQX3qDDPHszuXxckHGJWslCGipS3o6khLDj2h3+lp5XdIL/MRsXEXWlUfe1in/nRhM4qPvRq1HtNP27KEetcYRkVQwgeeQYiKKOcNn3e1+vJ54cGok4mors8IvNBM/IhZFmO1oBoPEP6o28P4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SN7PR01MB7922.prod.exchangelabs.com (2603:10b6:806:346::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.29; Thu, 29 May 2025 17:35:29 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 17:35:28 +0000
Message-ID: <a1ff2646-f429-4626-8541-19c7f301fc23@os.amperecomputing.com>
Date: Thu, 29 May 2025 10:35:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <3750d3f8-17c6-4bb8-8107-215d442e4ec3@os.amperecomputing.com>
 <2fb974bb-1470-4a5f-90d5-97456140c98f@arm.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
 <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
 <e3e6a3e0-3012-4d95-9236-4b4d57c7974c@arm.com>
 <0769dbcb-bd9e-4c36-b2c1-a624abaeb5ce@os.amperecomputing.com>
 <e8d74579-2e32-424f-bfed-5d3eb33b0a07@os.amperecomputing.com>
 <c44cb356-112d-4dd8-854b-82212ee4815f@arm.com>
 <936cc91a-b345-4e52-9cb5-922c9810c469@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <936cc91a-b345-4e52-9cb5-922c9810c469@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:610:e5::16) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SN7PR01MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: a71825c0-0f8e-49bc-bd1f-08dd9ed7341b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0UrSWIrK0E2S0VyOVhsK0dldVl2VXJDUkROVHRUUkpLNExtVjBDOFNTRFBp?=
 =?utf-8?B?cStWcUJGejdpb0pXUjBFNlFkcWU1SDJKVzlXZ0duUXdqaG50TDhGbkI5MVM2?=
 =?utf-8?B?YzljaG1YeUY3Y01xcjhPVU4vczNCMXZHNytBUkhnZTMzcHl1RDBSQkNQcnND?=
 =?utf-8?B?SWI5ZnQzc0l5TndaWHJtaUo2VHlmOXg3NXUzSmxVZDVVT09pRXdHV1hLWWFK?=
 =?utf-8?B?eDF6ZkdHY2gwY3c0WmltbHErVkZGM3V5OTNFV0E1Y3NueDdOVG0wWWp6YWU0?=
 =?utf-8?B?T2FTbGtYMXIyM1FZZENVZUdlV1RyeTd5NHhyMnBwVGlib0FaQWZCOXR2OGh4?=
 =?utf-8?B?dWlvMVJEVmFnYjNxUnI1b2FsbU5HVHpkUmZzMTdXR0lzV3FNN281S0NIL0JG?=
 =?utf-8?B?a09Xd2lkRDAvcnRFdkpqTnUxL0wvNmR2UG5jNk1KYTkzaEhKVW8zUXJoME02?=
 =?utf-8?B?UDBBbU11RFN3a3RVTXIyMWJpdjJwTXo1b2dZK0tPeXVta1JnVTVBVk0rcStY?=
 =?utf-8?B?ZXFEczlQbFd2aU1NY00zSThsWDFhSWkxd0lkMCtZZjdyMncydTRxb3Y4VEVW?=
 =?utf-8?B?UnhqbVo1TWlSTFVrdnJIZEhQenkzTWRJdlZySWlyNk9DTkN6Y3liYithaGFH?=
 =?utf-8?B?cndsVTZyc2NkSU1ZSlZFMDVQVElKcmIrVXZ4L0d3RmQ3b0pOdm9EOXoxVnJS?=
 =?utf-8?B?T1NVNXEwNCs1VFAyR2NqUHRzVEEwdm1LaDhteks5MWJJdDZSSzZNV2VnUnJi?=
 =?utf-8?B?aStlNFFNQUViZ2txbXhubllHeTExOHFTY0dpVjNDanpEc080bmlicXdlTzYz?=
 =?utf-8?B?ZEp5ZWF1c3ovMERVeXAzNXpUV0Znc0xIOGs2K1MzU2Jwa01aNXY3USs1ODB2?=
 =?utf-8?B?dWJDVkpyUTBWMG94dk9HZjhZeVFCbUZFdGZCTFJ6YWNhZnRkalVnQ0ZMWE9w?=
 =?utf-8?B?ZmU0U29TMmdMbnZRUmxrckk2MG9KZHBFNlEwT1RVS1NiVTV6cEV4enhIZTZp?=
 =?utf-8?B?Q3R0aEg2emdIaGVpejRmWlVvd1dWQ3pyQ1dkVDAzQUhGekIvOUZVUHd0Sldx?=
 =?utf-8?B?aFhRYUNDbVFLZ2lVSnpDWmdUeEtZdE5tcjBPKzU1TnFCMWRmN1BTZFNhT0Vz?=
 =?utf-8?B?RDlBRi9HMGthKzhpQ0VHV0tCVHdKZGg1bmJ1MCt6VVdEKzgyRUFrUlgxcmlE?=
 =?utf-8?B?OWdIaVdnZERoemJoSk54SWNKQnZ6MkZzMCtJVXJQSVJWeGR4NkdXcHBEVWlJ?=
 =?utf-8?B?NnhKdFZ0Sm0wRnVVZnhJbEhCQVZqMFVVTTVDNmkvUHAyYkozRC8wZW9RSGxw?=
 =?utf-8?B?N050S3NUdHNWWk5GYi84RFFRb1Rzb0djaGQyV2x4d0IyYU9WSUFPWlJGa2R3?=
 =?utf-8?B?L3VscExQSDZITktIRm8xYllpYmpIL1RpMWNndzRBeTBXc01vMU9CTlN3aFBv?=
 =?utf-8?B?LzBMeTZKTTdwdVB6bVdjZVpMc3BkQ0dobXNWYm1CRSt2OWlNSEIvSnU0Vmc2?=
 =?utf-8?B?UHBmdkVOK0FvaUh1SHdGYm8veG1lcEkyYzMvUnpVeWoycmFwYXIvOGZvMzVi?=
 =?utf-8?B?LzNzWDEwRTk5NWdZeFIxZGQ3a1dGMUpONjNBQXd5dzFXc0FKVm1YZTFYS05Q?=
 =?utf-8?B?aXdBbFlRRjBjS1lVTFZCZE1kT1NWUTBFU1BCQnc2YWR5cUxIdXUvcWZPaEJL?=
 =?utf-8?B?dFFwandGQVB1U0NJYzlNOUN0d21Eb2RRZHZGSU9xRCtQUDhwa2JXRnZuYTQ5?=
 =?utf-8?B?dEphZzJVWlpFT1U3Q2E4SGZFTVhRWkVjTHcvSldVWi9jeWlHaGVveUY5NTQy?=
 =?utf-8?B?MU1MSG93Q2NGQzVmRGZYQjF6NXZRSlhKc2xwN0dWVW1IS3dKWWxwYjBRVi9N?=
 =?utf-8?B?RllzRjhVTDg5bWhIN2lGTm40ZUlyc0VpZ3NxK2N5NEUwK1doWjI4Ujd3dXYx?=
 =?utf-8?Q?zZqu4jHf87s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0h0cmZDVE5mNTZkbjJFb0VxWE5LU1ZwQkFPRTNSZGFaT3VNdVhtWVJrbURv?=
 =?utf-8?B?ZFRkU1kxZDQ1MXZUQVk3ZjN1Yk1ZQVRCeXFTSlpKTmRzN2dFdlplUmFSdm9L?=
 =?utf-8?B?VGNtY2JaZ1B3VnF3ZmNnbnNBVDdBbHJ5clQ1dU11eTRFRHd4eGwvZjNDMWla?=
 =?utf-8?B?V2RnbEdCTkJKSjJ3N3pRVkZyWFkzOWxJcGluSzlhRGFlcU9hSjN3VUdwWnNx?=
 =?utf-8?B?YU44NDhCVHU0VThjZ0ZJRWd4UEt1azFNc1ZuMjNRaW0vNUxkd0RXWS9VaE05?=
 =?utf-8?B?VCtDaUR5MWN5TFl6ZllNTUMvWkNCVTJFaVFPaUNZeGhqSFJ4SlFGaHlMTmll?=
 =?utf-8?B?c1NSaStOUE5GZFpNTnBKR0VjQStSOHpHdmJsV0ZkeGFjK01XeFlmTUFsNXdz?=
 =?utf-8?B?T3ZERVNpZlYxaG9JTE9RT0JuUFV4dGRWL2xZMTdIY09CSnpncTJQajY0dkpa?=
 =?utf-8?B?K0plZk83ckF1ZWZFZjNucXVNS0RzcWVkbDlmT01ZOTN0T213QjFwWW1xWUMz?=
 =?utf-8?B?QkRoRkh4RE8zUWtRWnYwSjIrb1M1M2NmVWlQWGNJaGd0SWJTT05uY0p4TXlN?=
 =?utf-8?B?QjlkVUpzc2JFOXRzY0JpVnlsdnhEaUUrR0U3cXpWdGJEbGIrZUVtVkxJQXJS?=
 =?utf-8?B?RnBIbkdWb3NrUnAza1krckpIUytRejUySkM2YUdLL1ArcjR1NEY2d2c1ZjJu?=
 =?utf-8?B?Tk95RHp4RDN6TUllNnZrbUxLRDd1QXFPL0ZoMUVrVi91cWkrbmRFVTNZcTVT?=
 =?utf-8?B?Y1FKZnBjKzJmZG9oa3lFUlVyVHNab0dJa29KVUNFeXRhUjMxTm9EaG5ZSlFE?=
 =?utf-8?B?QTFReVpDaFcrZS90NFZ4YVlrU2NtOWlZcUhmZXpRb3lENDdDdUtSVDBaVjRH?=
 =?utf-8?B?U3YwSlYyQUtFUWxjc1luWXVTT0Jmd2hSSzdoWjFwbDVReTBpditPQ1J3eHNw?=
 =?utf-8?B?dU40VERJMisyOUxPb1VGZTRjWGlRN3JjYmFMbUdNbFRBald5ejJWVFFLNktS?=
 =?utf-8?B?NmxLVnllYW5pOEE4S0tPajhzZm8xOVg4blZFc0NzOXhCRWlLSlZKV1kvRGxm?=
 =?utf-8?B?bXE5TjM0QlBKcEpUcC9qVEtYT0dGeGYyL1FGTzlmeFBWUC9GZ005RlVOTHZW?=
 =?utf-8?B?WHNncFJlaVptWnh0Slg1ZTdGMXBaZ0czb09DTGpVbk0rczlNdkkrSWdaMWo4?=
 =?utf-8?B?WXNGNFY5NDVhSnZDLzRFMGZBZ3VETkVzMzlVcFBkMUNDUUNwaGI2bXo5WW5F?=
 =?utf-8?B?aGNFZlNOdFBoaThXMkpsejl3MVJKbFl3WEVHNk1uTllJMXZCOGhQRmdVcXUz?=
 =?utf-8?B?YXYxNWRoN05jUkIwc0h0NFRNRjlNaEp3MDYxWElXOFdwNS9YQnpFaGFBZllM?=
 =?utf-8?B?K2s5MmhhR3RtbWpWYTRyY2RUL3dLOUhGdjA1a2czQkM4bmlxbXVCQnk4REx0?=
 =?utf-8?B?VFcyWmYvNEJaME1GYWNIaHlINDVsUzREK2NINDVGWWxFRUQ4blhkUnVNUDJz?=
 =?utf-8?B?SVFqOVhITWUwbnBMUU54UHh5QWRXbW9taWZUYW14NkhrbnJoME9iZmJCNmcz?=
 =?utf-8?B?SmliR0hXRG1heFBiSFY0ZnVyRzdGeEVXZGN3TWNlRVZlZzd1THd5S2xzd2Iv?=
 =?utf-8?B?MFg4K2hYUFh2RFNMdHlIdUoyKzJMZFFVOEJUUUQzaHAwajNraWRKNjY5djZw?=
 =?utf-8?B?Z3dCelVHekNGenpvQkE3cmpNKzhGL1RsYlZNY29JQi91RGZTbXlJbTc4Mlc3?=
 =?utf-8?B?SndRY2RyUG44M2RFMTlwMXNjR0wwaks3cEVoNWRwK3ptNmpSMUUvMFpCMVZQ?=
 =?utf-8?B?Q2RQKzNvbzBaSUVwL0JYVE93VXMzYkZDRVk3WVFFaWc4VzRBQm9ObnV5MGZj?=
 =?utf-8?B?UjJIUUVKQy9LbFhWS3A1YkFzaGp5MTdZeHEweG5RRkhzSVl4UWlKTE05MWhI?=
 =?utf-8?B?alUxSnBMbENnOVFMRmdCaUFFelR4Z3QydjZJRktJVm9UK1c5dUZ6LzNaQ2Zh?=
 =?utf-8?B?MS9kOFRuWU84WHpLMEQvOGxkYTN4QXNrbW1IYWRuaVd3U0x6NVk2dW85aXpx?=
 =?utf-8?B?b2FXdm9sL1NqMHF0MVJocTUxWUJDWDNzMlY1UzZhTWxxTFpsdEdyQVFSb2po?=
 =?utf-8?B?VThiWmpmRjkxUlRYUHJDbmI1QlIrVmd4YTJYM1ZLZjlZS1dVanZ6dTJtNlI0?=
 =?utf-8?Q?aopmZxjUIJxQ1OdrM6plF8Y=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71825c0-0f8e-49bc-bd1f-08dd9ed7341b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 17:35:28.7188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2LIOB434rqhs6nOpiSQKDnE5hWL044nlpU7ZBkiPzQTX9MaCJTB5FwjCqE13Y8OEJIYYXY6+UMpmVKtkI2ls5uv76QnhexXbCmXxH1G79Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR01MB7922



On 5/29/25 8:33 AM, Ryan Roberts wrote:
> On 29/05/2025 09:48, Ryan Roberts wrote:
>
> [...]
>
>>>>> Regarding the linear map repainting, I had a chat with Catalin, and he reminded
>>>>> me of a potential problem; if you are doing the repainting with the machine
>>>>> stopped, you can't allocate memory at that point; it's possible a CPU was inside
>>>>> the allocator when it stopped. And I think you need to allocate intermediate
>>>>> pgtables, right? Do you have a solution to that problem? I guess one approach
>>>>> would be to figure out how much memory you will need and pre-allocate prior to
>>>>> stoping the machine?
>>>> OK, I don't remember we discussed this problem before. I think we can do
>>>> something like what kpti does. When creating the linear map we know how many
>>>> PUD and PMD mappings are created, we can record the number, it will tell how
>>>> many pages we need for repainting the linear map.
>>> Looking the kpti code further, it looks like kpti also allocates memory with the
>>> machine stopped, but it calls memory allocation on cpu 0 only.
>> Oh yes, I hadn't spotted that. It looks like a special case that may be ok for
>> kpti though; it's allocating a fairly small amount of memory (max levels=5 so
>> max order=3) and it's doing it with GFP_ATOMIC. So if my understanding of the
>> page allocator is correct, then this should be allocated from a per-cpu reserve?
>> Which means that it never needs to take a lock that other, stopped CPUs could be
>> holding. And GFP_ATOMIC guarrantees that the thread will never sleep, which I
>> think is not allowed while the machine is stopped.

The pcp should be set up by then, but I don't think it is actually 
populated until the first allocation happens IIRC.

>>
>>> IIUC this
>>> guarantees the code will not be called on a CPU which was inside the allocator
>>> when it stopped because CPU 0 is running stop_machine().
>> My concern was a bit more general; if any other CPU was inside the allocator
>> holding a lock when the machine was stopped, then if CPU 0 comes along and makes
>> a call to the allocator that requires the lock, then we have a deadlock.
>>
>> All that said, looking at the stop_machine() docs, it says:
>>
>>   * Description: This causes a thread to be scheduled on every cpu,
>>   * each of which disables interrupts.  The result is that no one is
>>   * holding a spinlock or inside any other preempt-disabled region when
>>   * @fn() runs.
>>
>> So I think my deadlock concern was unfounded. I think as long as you can
>> garrantee that fn() won't try to sleep then you should be safe? So I guess
>> allocating from within fn() should be safe as long as you use GFP_ATOMIC?

Yes, the deadlock should be not a concern.

The other comment also said:

  * On each target cpu, @fn is run in a process context with the highest 
priority
  * preempting any task on the cpu and monopolizing it.

Since the fn is running in a process context, so sleep should be ok? 
Sleep should just can happen when allocation requires memory reclaim due 
to insufficient memory for kpti and repainting linear map usecases. But 
I do agree GFP_ATOMIC is safer.

> I just had another conversation about this internally, and there is another
> concern; we obviously don't want to modify the pgtables while other CPUs that
> don't support BBML2 could be accessing them. Even in stop_machine() this may be
> possible if the CPU stacks and task structure (for example) are allocated out of
> the linear map.
>
> So we need to be careful to follow the pattern used by kpti; all secondary CPUs
> need to switch to the idmap (which is installed in TTBR0) then install the
> reserved map in TTBR1, then wait for CPU 0 to repaint the linear map, then have
> the secondary CPUs switch TTBR1 back to swapper then switch back out of idmap.

So the below code should be ok?

cpu_install_idmap()
Busy loop to wait for cpu 0 done
cpu_uninstall_idmap()

>
> Given CPU 0 supports BBML2, I think it can just update the linear map live,
> without needing to do the idmap dance?

Yes, I think so too.

Thanks,
Yang

>
> Thanks,
> Ryan
>
>
>> Thanks,
>> Ryan
>>

