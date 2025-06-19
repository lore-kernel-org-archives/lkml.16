Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA6C26C39D;
	Thu, 19 Jun 2025 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341178; cv=fail; b=h4dOAxTurVDWLvIo/THf7rDhWnc00RgCWjjUdYTEbXL1hm1qUy6fpQS/Xono9AhQpYgnuPzWhA117c24jcOWm3cfpLpDV3S0e1+X5qxINm86MEsayCksSdvwqstPWlhxamDIPxRLekFlt/nRkeioLZEMfdekEpjm/sghZiHLc5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341178; c=relaxed/simple;
	bh=6Fo4ymL89zFP7tmXWARi4J2Wyig0LVYiovNezerchbA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wk6p93bQmxpDpzgTPbkPnq6EcJJ2O7pzagO7nnIdY4b2VKSjB4pIQ9LXOGKsXSNCd0Y51BduSNiE6Dnpuo6FAgDR7G0hsRk82sjQDNuWboJ+2tr+pijTAgD5m5xyxYMayFaR6c2GjFbgFguDvsXi5hVtPAUd3778TZTLHBk9Vgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=BEqVaApm; arc=fail smtp.client-ip=40.107.236.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="BEqVaApm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBFQulp1tLOLvt+7PNSiuaOuDfoayeltBJPlu+ZuaKPeHYbDQa/77l2TIl7Wrdw3ax7+7eY7+cBROJjLJecmIpBU8admNFPj+UBf0A+zycm3uzYQiyfowF+LVtfXPsNwPK3QGTe+Yb6PQS2H0R3pg05IyGCZvPksPT355A8IKRDqyTfV1pmRGXEG0zT2jgZ6kBb5IoPuh50mywUCnBsVnRyYS9k5XeQCpVYNQ/GW/hZaWnHm6kmVTW+UqVLZ6JVJ6TnIdpmbn94r2YTFQQ4gsmQwdBzlZFXqrtKg/JnKXJ6P8tkRilOy/+Mlqm78xnytKtg3e3iAwSbv8bhxc3SV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxezDLaGEUGZFa95pJJDS2zjRfHDl/WW13W+se/DDbY=;
 b=YsnpKJDCE3cdpZt70w2LjyhzORp3LtRF0TrZ2q7LWXivGLNPR48DzlEM3EABGJyjnyYTLa2xgXvHqTpVMM6e1fIK2FMuNlbOAjRqaiGil+cjAqG3sDOl/dTdYzZLlN28A7G4O49NnU68fpyBseEBovzWLveAY5O8VvacIuZJhkwZq/Mi0jH4j5dwaAooqKJy+xecBX6Ggwqvd0Kwqh14JLbwg3+oXLZPNZRuLWnijmWoT0UhdbEs2WvyAjsVP6Zr5tPEcqjDjGU6HvTjyAioHjPzAGLbuygQRwg2WTgRQ4hOTdkQeQVQUp6h5crwL2rtnI9h+dMZFDH7nUpn9GIWzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxezDLaGEUGZFa95pJJDS2zjRfHDl/WW13W+se/DDbY=;
 b=BEqVaApmLRO0NQuUBpleUJvYUMyTpDOCI1vJo6+LosWZGTnbKZVqAp6E/dIv7vCnrcBqbY7gHC/nFwQW607lVlgfMMYXEbBmI9NeIIkzreJzoa+H8j3vYGkeiEkmZp+4a5lKqIZlutIwRW8pUh/2tJ03r/fsoyuC+JZcYfrsmde4U2L105WTTbWblZz+sDRSEkqIZAOx4mwKe2JnDcr5Q46FNcrGFunbCsNPSCMTLyYCsde6QCEdZHxAWrbXVTVt7tgaHDnU/rg4gs/OyFqzBO6VhEMjrJnrdxAjjUGnAMtcuqjxFhZpDDjz/PYlVaiGsjNRBWOnFdyYJw6VBrAyWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 by PH0PR03MB5815.namprd03.prod.outlook.com (2603:10b6:510:37::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 13:52:53 +0000
Received: from BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e]) by BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e%5]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 13:52:53 +0000
Message-ID: <75f37ae2-153f-407a-a32a-8094d30c95b9@altera.com>
Date: Thu, 19 Jun 2025 19:22:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] firmware: stratix10-svc: Add initial support for
 asynchronous communication with Stratix10 service channel
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250610-sip_svc_upstream-v4-0-bcd9d6089071@altera.com>
 <20250610-sip_svc_upstream-v4-3-bcd9d6089071@altera.com>
 <e1a26da6-9733-4e87-b794-97baa2a9cb7d@altera.com>
Content-Language: en-US
From: Mahesh Rao <mahesh.rao@altera.com>
In-Reply-To: <e1a26da6-9733-4e87-b794-97baa2a9cb7d@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::17) To BN9PR03MB6201.namprd03.prod.outlook.com
 (2603:10b6:408:11e::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6201:EE_|PH0PR03MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: c41e6a79-b950-4ca1-50e6-08ddaf3895f6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmR3cnVCU1JTN1l0YjQyVTVNWmcwclNvK1ZXcXhWZlR3ZmgzZUJDR0hXQzlK?=
 =?utf-8?B?OElXbCtReElhTEVHYTNlQTVPQXcySUZiUVAyS2k5K283Tk9lSmRGOGMvUDEr?=
 =?utf-8?B?YzVad29SL3hUSHNjaE1rWVJ0c0t4YlJVRlFodmt3czc0V2h6aVVsSlh0OHRG?=
 =?utf-8?B?SHhyaS9zNU54QnNPRUZxNy9xMUVKWXBzTi85SzBCK0FreVk2MTB5UEs3VVc1?=
 =?utf-8?B?bG11cjc4Z0dlZ3F4eE8vT0tPZWlSbk10Z2F5ZUp2clJJZ0sxeHBtTVJNZHRX?=
 =?utf-8?B?OFZMczUzU1NjOHlkSnhUbGd3RnpNcllrN3NhNHFkcXhvL3daSnFyVFJ6WEl1?=
 =?utf-8?B?ZTFLem1Vak9COG1Cb0ZydlhTeDFNZnBWdysyVU5mTG53eGQxc2txYTBKQVYz?=
 =?utf-8?B?d05SdkZZYzQ4eEpzbWJFSllsZzFLaUR2Vmx4NkhIODVRZG5vbkxnVmhIVHlo?=
 =?utf-8?B?aFlKV0creXlEenkyR09KMkZWVkxDcHRKcXVrc1JGUm9XZ1NVUTY1bzBrc0Y1?=
 =?utf-8?B?OFltT2xCOWhTS1VsaktYeTdsN1dCclRQUlpFWHZydGJ5KzFGM3gzR2hWY0pL?=
 =?utf-8?B?ZlFQYnk2aExPM1hzT0YzRnlkYmFSTS91OVZ5NUQzbUZ3UkJGeTZaQkxZWGRw?=
 =?utf-8?B?QWNxSXpLSVE1SWlja0hpL0xVSzA1aWxWUHRyTlFiZC82WVR2ZGs2NDc0TGw2?=
 =?utf-8?B?WVV3NnNGT0RIOWFnWnBaOG9ycm1jOTU3QzBCaGM1TDVRWEJiMXdNY2tiUUlP?=
 =?utf-8?B?QmFqV0JnSVd6U3RnZHVCZEVvTHVxaWFZaUpJaXduVjhOcmlVR3ljb2Facm9l?=
 =?utf-8?B?VkM3UytRazNIT3lXZG5jN3owOW80d3VyVnpNSVB4Qk1CcC9SMkJVUFd0L2Fl?=
 =?utf-8?B?MW9JWi9JNkRuRldNK0VReWhaSWNNa0xsV1pKMmtSQXlwbVFFUGNBeXlHKzF1?=
 =?utf-8?B?RS96VFM0d1VBeFdOUFVDS0E5bng4TmFadTUwcldaTU04em5QWXF4SmUwR3hO?=
 =?utf-8?B?MmRaNXlHQURmV3ZBVG9TMmJGQTF3UmNYSDFHTVlKNEJ4Um92MFhXS1M5QUVY?=
 =?utf-8?B?Q1dSWXZHc3NXUVIzOTk2SldUck5mbFU1aEtJajI3L3ZEOFNWaVZWelpmMUdu?=
 =?utf-8?B?d09OdkFoUlJoS0kzOG9UOWhESUtVYTZxZzM5aEEvM2RXRDJ2b1Rzek1pS0dp?=
 =?utf-8?B?dzNWMjd2M3dWR1U2QVVTd0hWc1JXWHpQR1BmV2VwMzN0NWJ0VjIvVXZqaFFX?=
 =?utf-8?B?ZS9mUHI4VjhFRDhoTURXblNOcmpIWUVVVmd4cDJjb0crSWJELzVYNGJVcDFx?=
 =?utf-8?B?OC92L2F1NnNnT3Z1RGdmTDZiRkkwQXJGekZNTnlMT2xoazdMckhFRUZjMTFV?=
 =?utf-8?B?bDlBdzZVbHNYTW9rSlpGZjI1STRHR1YrcjAzcVM2ek5pYmJhd292bVJqb1Zh?=
 =?utf-8?B?ZUg2TGIrZWt5eEpyNFM4cUppTVluNzl1Rjk3SDBnTXV0TGRGTExPK2c3RTBL?=
 =?utf-8?B?MTczU1JiOGw2b0tUb1FJWHJ3WkZRdk5jMXNEblpSZytSbnlLTmpLOTlBcnBP?=
 =?utf-8?B?N0ZsaWZOZDlVSWRydm5hZ1p5OFFoL1QxSytkankyK3A0R24vb2ZZejRpWC9y?=
 =?utf-8?B?OXd5WjQwUVorOHVBaStWRjZJWUxFTHVneXpMTVJ4dTJWMVVhSlFLUmdNYzFB?=
 =?utf-8?B?dm9WSWpNRUJkYVd1b2FFei85SzZnTVkzTlhBS0k4U3BGRmwvd2p4TGcrNDVZ?=
 =?utf-8?B?YmNZUG95TEpKZUVNejlCbjd1Q0tQckhWbGNIZUJCQk0rZ0ZvNkE4dlEzYzZu?=
 =?utf-8?B?akU0MEZCeWNGb01xTFRPYnRnUDdGb3A1SWVvNzdDdEFxbW9TNEVEdUZNZitQ?=
 =?utf-8?B?RERqVVhWRTN4bFJmMWFCR0hJdTlSNHMzSTZVdkRvSFJ0Z2NnWDVZVWVrME9r?=
 =?utf-8?Q?FLiEYut/xOU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6201.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0M0YUI5S04wL1FGNVhvYUFRSXZDTWJFWnMwblptaUJiL21FMXcxcHBMRHZo?=
 =?utf-8?B?ZVpRKytSNGJ4SWI5TlkrMjFCSUo5cW5mMEU2eGQ1MUZmejc1K1k1QnU3bUg1?=
 =?utf-8?B?elNzckk1eC9VU25FaHZtWS85NldKTkM3Q2JNNWRlRW80SEhTbThUZkxrY1FJ?=
 =?utf-8?B?QUdEMjNDanZIV0pZR2NyQlNja0NXeUtoNXUyRXVtTU1aOHZleTFsZHpOZE1X?=
 =?utf-8?B?cnBRM3Z5RU80YjZBMHVXUTRjakhDZnB3T1hMUm1wZmlkWExadEQyTVk0ajhB?=
 =?utf-8?B?MjZMWGE2M0VvQi8yOXJQNmRFOHhqUzBuYTJIdEp0UzNyckpJeFhJbXJ4YllC?=
 =?utf-8?B?QjRhMmd4SFdDMHUreVd2NkpFSGNtSy95NGNwQlBEN1o4VDVqbWY2ajYyR0t0?=
 =?utf-8?B?SWFDREgxSEszV2VaM0V3dXErSkxqSDJGcGxJVGhIQjEwbjJpL3ZyNjVIcm1C?=
 =?utf-8?B?VEl1WnlSQzVVLzlXc2pJUC91bHNNcWpYdU1IWlNBUXp2WWkyS2Z5WXRQa3JU?=
 =?utf-8?B?MWlLbXRiUHpzc0tUeDdRWjNqcGlrajRiTS9DWmRZSzNHVGNMZXplV09iTE9M?=
 =?utf-8?B?OWd6NWpjdWZKLzhBM1FndWs4QUdBWXZ0MVJmb3UvR3JUUTJOQW9WOTBJbXZH?=
 =?utf-8?B?YjJjN1NtQ2RnNTY3anIzZUpoV0NlbnJlSEd1L3Nyb043UVNhdEFCb3BRQkVF?=
 =?utf-8?B?SmVLNThXVU43TjFFcUo4NTFzQU92aXUwWEF0NDAxaWtVVGgzNGVQRmpudjJi?=
 =?utf-8?B?VkJOV1ZkR1RScTk5UWdBOHVsOXNHaW14U01MN1dnRWdnRHFNRGwvNStUTGRO?=
 =?utf-8?B?WnJGZ21ReThYd3NOUUhRMFdpODNYVEJGSXRwVmVuWmRydVlMMkM1dEo0N3lO?=
 =?utf-8?B?clEyNXd1YVUzUnFoVHV4S1RmKy9nS0VlVWpLMWJOV2xiS2cyYnNJYlBVcFRa?=
 =?utf-8?B?MGhicWY3c1k0U1VNd2NFQmhuRTBZQitsem1ZQU82dDFlU3Vwa3VDQTVyeXd4?=
 =?utf-8?B?KzIyNklnQkVPMFNyV3ZYa3d4MGs0elNpSitkT3htSnpvRTVXMzk5dnhlL095?=
 =?utf-8?B?VEs5NVNSYm9jRnl4L2plbWFDTmZXaXZMd1hWS2x0RFA3UkxqdzZhbmpjM3Vp?=
 =?utf-8?B?c1UvQWMyUmFEYm4xdzlpZ0t2T00wTzdOMEZUK2xKM0NxY1JnZGVpT2g0Qmpl?=
 =?utf-8?B?YkR1cTBXTlM5V0ZsNjZWalIzYStyYTlLelY3ZnRXVzVGUkxEV2xmd0V1dkd5?=
 =?utf-8?B?QUxnTFRIbXJFVjhuN0VEdXpoRW81VWxRczgyZ0lKNlVVcktmdW5rUXVic0o0?=
 =?utf-8?B?bWFxNUdlMm84cWlycWZLM1BhMG16MUsxSW5MaU9SWk5zZzA1MjEvMEd2NEdz?=
 =?utf-8?B?eUM4REpaaWhQMXVOL0l4b3hRUnI5bkI3eElySHViUTloa3RaK0cyd0ZsbGdW?=
 =?utf-8?B?KzU4c0dxa3R4VWJoZE00UGwwTmhCZng5RXNITnAxRENuek9rek10ZGZRWjVv?=
 =?utf-8?B?b1dPaVYyWVFqUDdaak9oT3BxN1IyYllFZGlVUGFoUDlLcnFtM0dvMk9BU3dY?=
 =?utf-8?B?TzUzZ0RQeThkQXRPNDhtUmNudDAvYnFRZkVmbldMYlFYa0FkWEduOXowMnVn?=
 =?utf-8?B?V203ckVBN3BJV2lIWVlLNWVlNUNQekh1QWtETGdpZlZCY1krTU5UZ2JZU2Yz?=
 =?utf-8?B?N1VIWFpicno1OGh5WmVrRkg2RmJqRWhqSmljekJieXgyYUtUSGM4bC9GTC93?=
 =?utf-8?B?UDJ4RzRtWnNiZnJrbjZPMmVNUm16QnlGSlJXdDl1VE00Z21udDFqdFpCdy9v?=
 =?utf-8?B?N01vMjBBZU9wUlNacDJzZitoZWZNYnJiUTFNQ3U1cW1jaVZPb3N1aEFzWWV5?=
 =?utf-8?B?M0J1WlczZGxRQWo3eTRDYTM1M3IrdExOczU2QWJLaTg2Ly8rTGRVNXpUMmRw?=
 =?utf-8?B?RFBVYTFhOUo1TDltYmVQMTlrTXBIOE42M3BQRENTbnp1amV3UEJ6Z2Ivc05J?=
 =?utf-8?B?bFZMak1DaVZ6T09uVHVtcU5WeGQ1VDA3VEd5NUtkVlFlV0IrVmo5WVl4MG9L?=
 =?utf-8?B?ZFhtcnB6V21qVXdIUXVNYmhCMWpYcXFvY3ZTUEVONW5YSjRiQ1Bka3lLbUE3?=
 =?utf-8?Q?/bU9xpWqoLEoL5+ilZKZTN16I?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41e6a79-b950-4ca1-50e6-08ddaf3895f6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6201.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:52:53.7239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvR69PSxveywndpEupIB/57Ts2wR1F/SKLdGvR/qj1ZRhNzuMxeKkxyhIVwHCu9ABv6WC3lZKbSa9nadB8Wezg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5815


Hi Mathew,

On 11-06-2025 09:40 pm, Matthew Gerlach wrote:
> 
> 
> On 6/10/25 8:37 AM, Mahesh Rao via B4 Relay wrote:
>> From: Mahesh Rao <mahesh.rao@altera.com>
>>
>> Introduce support for asynchronous communication
>> with the Stratix10 service channel. Define new
>> structures to enable asynchronous messaging with
>> the Secure Device Manager (SDM). Add and remove
>> asynchronous support for existing channels.
>> Implement initialization and cleanup routines for
>> the asynchronous framework. Enable sending and
>> polling of messages to the SDM asynchronously.
>>
>> The new public functions added are:
>> - stratix10_svc_add_async_client: Adds an client

>> +#define MAX_SDM_CLIENT_IDS 16
>> +/*Client ID for SIP Service Version 1.*/
>> +#define SIP_SVC_V1_CLIENT_ID 0x1
>> +/*Maximum number of SDM job IDs.*/
>> +#define MAX_SDM_JOB_IDS 16
>> +/*Number of bits used for asynchronous transaction hashing.*/
>> +#define ASYNC_TRX_HASH_BITS 3
>> +/* Total number of transaction IDs, which is a combination of
>> + * client ID and job ID.
>> + */
>> +#define TOTAL_TRANSACTION_IDS (MAX_SDM_CLIENT_IDS * MAX_SDM_JOB_IDS)
>> +
>> +/*Minimum major version of the ATF for Asynchronous transactions.*/
>> +#define ASYNC_ATF_MINIMUM_MAJOR_VERSION 0x3
>> +/*Minimum minor version of the ATF for Asynchronous transactions.*/
>> +#define ASYNC_ATF_MINIMUM_MINOR_VERSION 0x0
>> +
>> +/*Macro to extract the job ID from a transaction ID.*/
>> +#define STRATIX10_GET_JOBID(transaction_id) ((transaction_id) & 0xf)
>> +/*Macro to set a transaction ID using a client ID and a transaction 
>> ID.*/
>> +#define STRATIX10_SET_TRANSACTIONID(clientid, transaction_id) \
>> +    ((((clientid) & 0xf) << 4) | ((transaction_id) & 0xf))
> Consider using the macros GENMASK, FIELD_PREP, and FIELD_GET from linux/ 
> bitfield.h for the above.

Will make the change
> 
>> +
>> +/* Macro to set a transaction ID for SIP SMC using the lower 8 bits 
>> of the
>> + * transaction ID.
>> + */
>> +#define STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(transaction_id) \
>> +    ((transaction_id) & 0xff)
>> +
>> +/* Macro to get the SDM mailbox error status */
>> +#define STRATIX10_GET_SDM_STATUS_CODE(status) ((status) & 0x3ff)
>> +


>> +    if (!chan || !tx_handle || !data)
>> +        return -EINVAL;
>> +
>> +    ctrl = chan->ctrl;
>> +    actrl = &ctrl->actrl;
>> +    achan = chan->async_chan;
>> +
>> +    if (!achan) {
>> +        dev_err(ctrl->dev, "Async channel not allocated\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    struct stratix10_svc_async_handler *handle =
> It is better to define all local variables at the top of the function.

Will make the change
>> +        (struct stratix10_svc_async_handler *)tx_handle;
>> +    if (!hash_hashed(&handle->next)) {
>> +        dev_err(ctrl->dev, "Invalid transaction handler\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    args.a0 = INTEL_SIP_SMC_ASYNC_POLL;
>> +    args.a1 =
>> +        STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
>> +
>> +    actrl->invoke_fn(actrl, &args, &handle->res);
>> +
>> +    /*clear data for response*/
>> +    memset(data, 0, sizeof(*data));
>> +
>> +    if (handle->res.a0 == INTEL_SIP_SMC_STATUS_OK) {
>> +        return 0;
>> +    } else if (handle->res.a0 == INTEL_SIP_SMC_STATUS_BUSY) {
>> +        dev_dbg(ctrl->dev, "async message is still in progress\n");
>> +        return -EAGAIN;
>> +    }
>> +
>> +    dev_err(ctrl->dev,
>> +        "Failed to poll async message ,got status as %ld\n",
>> +        handle->res.a0);
>> +    return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(stratix10_svc_async_poll);
>> +


>>       init_completion(&controller->complete_status);
>> +    ret = stratix10_svc_async_init(controller);
>> +    if (ret)
>> +        dev_dbg(dev, "Intel Service Layer Driver: Error on 
>> stratix10_svc_async_init %d\n",
>> +            ret);
> If the call to stratix10_svc_async_init fails, it seems like 
> stratix10_sv_drv_probe should fail too.

Will make the change

> 
>      if (ret)
>          return dev_err_probe(dev, ret, "Intel Service Layer Driver: 
> Error on stratix10_svc_async_init\n"); Matthew Gerlach
>> +
>>       fifo_size = sizeof(struct stratix10_svc_data) * 
>> SVC_NUM_DATA_IN_FIFO;
>>       ret = kfifo_alloc(&controller->svc_fifo, fifo_size, GFP_KERNEL);
>>       if (ret) {
>> @@ -1470,6 +2106,8 @@ static void stratix10_svc_drv_remove(struct 
>> platform_device *pdev)
>>       struct stratix10_svc *svc = dev_get_drvdata(&pdev->dev);
>>       struct stratix10_svc_controller *ctrl = platform_get_drvdata(pdev);
>> +    stratix10_svc_async_exit(ctrl);
>> +
>>       of_platform_depopulate(ctrl->dev);
>>       platform_device_unregister(svc->intel_svc_fcs);
>> diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/ 
>> linux/firmware/intel/stratix10-smc.h
>> index 

Regards
Mahesh Rao
