Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9F025C6E3;
	Wed,  9 Apr 2025 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744198442; cv=fail; b=ACRD9oTCMiM1ujI/Vi8uU8B6ShMoz0Zk4fkbWdjXXQ2Eg4heM2B4mE3IZulDF9cErpLrscPj5LL2Vgyml6Tlg/zQ1fiUJKT84v7qi458iIQYvJUj8wXd/YjKTXvx8jyEiFRJLAERfnr2VCr9v0XWci1Wl8CtdTnV13eLFBA3EFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744198442; c=relaxed/simple;
	bh=YQ2X1obiSkF+mlTnsxmhhsM9RXlp/Y/G6mWl8Q0uMeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWvsaUyqg5QdrM4nLVUh+trEoZRMNaZKtGE+CXUUY2OIEVjRX0lXqVa2fMnDGGKyZu4ojg6xNEcadYCVrx663wYlxhQgQkycNPy9q+paeCarBjrw807bX0YeZiyzsL5GCvpGUP7xZ/47mAIeK70VvN3JKkrRZYXTj3FKFWU6HKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hFnGbBDS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yN5DNzBj; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hFnGbBDS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yN5DNzBj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5396PsYJ006541;
	Wed, 9 Apr 2025 06:33:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=bIz1U88PZkIcxnjtu9wTnBZ6D3kNXxgq/5CDk0qw8Fk=; b=
	hFnGbBDSImD4Nb7A9Aw1OxYwwqYEznmaEqztA0BzZPN1oyZIM83j/jTSz1KtLL9k
	RVUFB+Jdwu9fg/lw4y1ly1U8RqgouOdJuZRZdZHDccWs/3GaVoIKiz99MPVFnRNn
	x8XsuCzI7cOOh3UR9WrC3I9fB/rZc1S8gQl+U3mp2CcfOIOhiDLM16cpTxihsZ9v
	EHIoSrkQl/DvslXECFbmoE/sTp0N0hy8F4tE4Rm4P/SqZjXkbXQUcrU8Cb026pxn
	dTOcchhxT1sPnm6vKVMsy+SAVXSstHk7/QzV1vqG5t5M2xrNMdSUQ3W1xbL2zRHs
	3MulBJd6Z/FgAm21O6f3Xg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45vemwm0r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:33:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P10xzDrqZqWZI1v8MLXQId/ASf7lM3Ei0Tm1y1WuFNmsjOysigjCoSDNOx1+YshIzGP+FTahkuIFBudyhRVltdiRYhbltTXtyZ3QMp/kE9fiYwLuQr/tXb1AZhv5qUs7P3WKYp20UASZVyVJjMxWH1qBgg6sTLmsyosDYItQh14riqT78FREgAwP3ovveD8DrI5JID1OxEjtdaSOLwCy7BPhJS1w13OXYk4N4duM94VPBXyLLZyOrECDpWyxrvHQRsy50hndaTQ8iqTKb6yIlRagBn4+1KkILybUJ6r8OgC10PMh59R9HDLKTAY7PgfWC2BnCH8YcjU73OBe1Rjn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIz1U88PZkIcxnjtu9wTnBZ6D3kNXxgq/5CDk0qw8Fk=;
 b=iGGN+xkSSElImnD3mnlga03mOID5H/7uF7jIveUJoKttcOtFRlcwyxjktH6ItBu1kUYNXw1Iw+nocGPEmfQc/Lvg+pgZ5wvmDnIX70YtrBqf4xryMCq/Gt9qxLrWPRM6y2CGiFpVi+9wvJFLx+x2b6hvoS50OwLihXNGB58pSpCyanEy8y3zQEUDeck5ImxUTl8ctoQBD6tdwVjBRPJJz2olCMpWDQBkyZAUme4i21Dx1DKol6qcS5lf3MMytqY0EVxN+JicVC+zppQbfFoUhMLcnLmPVOuupUS3fpvo93TqZT7NOZeaHbHeaNEeAGtxqIx0favrivz1Y2YVZXVfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIz1U88PZkIcxnjtu9wTnBZ6D3kNXxgq/5CDk0qw8Fk=;
 b=yN5DNzBjotXoE6qGi1IcWgDVzYH+/IY8DAV5Pj/L8pw/pfaSIYgAp5UtXWdK5kKTJ/7IvN+7x/CeOsbVPXcvJpUYyPLK+KLUy4IacW9TrSr9i9csK2TWiLmV6jiF8CbEPIw1Kul9jbc+2BNltEPD/DIrRL7kegSTevRaQXJrjgc=
Received: from PH7P220CA0046.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::10)
 by SA1PR19MB6669.namprd19.prod.outlook.com (2603:10b6:806:258::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Wed, 9 Apr
 2025 11:33:52 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::b4) by PH7P220CA0046.outlook.office365.com
 (2603:10b6:510:32b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Wed,
 9 Apr 2025 11:33:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 9 Apr 2025 11:33:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 95F35406544;
	Wed,  9 Apr 2025 11:33:50 +0000 (UTC)
Received: from [198.90.208.23] (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 98705820259;
	Wed,  9 Apr 2025 11:33:50 +0000 (UTC)
Message-ID: <4b00f887-143c-415d-a464-dc847b7d84d5@opensource.cirrus.com>
Date: Wed, 9 Apr 2025 12:33:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] ASoC: cs35l56: Add struct to index firmware
 registers
To: Mark Brown <broonie@kernel.org>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
 <20250407151842.143393-3-sbinding@opensource.cirrus.com>
 <c1043fc8-40e3-4ff9-bade-bedfe7a19a18@sirena.org.uk>
 <e3447ca4-ea19-4c84-802e-dc3832ea2dd6@opensource.cirrus.com>
 <f9fcff2f-34b6-4291-82d1-3b40c0f7e8e6@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <f9fcff2f-34b6-4291-82d1-3b40c0f7e8e6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|SA1PR19MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d512453-9d76-4e7e-afff-08dd775a677b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1M3YlFCV3lSWjJDa3RsNzFrZ3ovQXpVWkdiaDVmQ2NUQm1TWWlxa2p3VDBr?=
 =?utf-8?B?UVdaaFFFQnZuclJBYXJRQXBuV1o2L29PdGdlVVoraW04UUc0N2YrMnZSRVFW?=
 =?utf-8?B?WU43UUdXU0tydUREU3NZL1VhekZsN21ERkRoWU1uNGFaYXZFSCtDZS9uTWVi?=
 =?utf-8?B?SjRMcHZjbitEVFdwaVNGeHRHbENUWWN3VWVoVW1CSTRmWWtFUUJOYmNuMDR0?=
 =?utf-8?B?THZ1Z1BZTThVNllwY3Q0UFl5VG5rTk9BdUZVT3NZQ1hMTTJ6dkdSSmV0Snc1?=
 =?utf-8?B?Z2kvZ3ZleEU0Yy9DK25BeVVXaHlNbWFrbkFwV1d3dWRvNFkrRitRNzg4WHJi?=
 =?utf-8?B?d3Z1NFBUNDdwdW5tWU0zby9qWG5zL241eXNqUkc5L0VvOEZBUnZEZ1lmTzd2?=
 =?utf-8?B?YjM0QjhzbmFLazdxbWIvMHZZRVpibmcrU05OZGJKNXJkM2xRS01teFpKa1Rk?=
 =?utf-8?B?bTNKNGVzR2UrUGk0TzRYdFRRdFBGajhVcDFRcmR0aXMzM2dWV3JCbTQ1dVI0?=
 =?utf-8?B?Vm1VL0VGcFFZUmhCa3d0K0Y4V29KRDhZOExIcEJLK29zeG1icko0UDMyZDlk?=
 =?utf-8?B?aXFIZXFaMldndFdQMjZ5MTB1ZTZObXRlL1Z4S0pSZGttOG5rN0dWRGtxSEtM?=
 =?utf-8?B?TEhKZ1RRdER6b0oxdlo5MGpBZi9Ba1NDeG80aVF3V0FicFYrNUZZZDdNelFj?=
 =?utf-8?B?dFV5Ty9pazFGQXVUdElPd3FBbnV2cGFCRUUvSVJuWkJoL2Znd20yclVKRTNt?=
 =?utf-8?B?dy9xeURLZGR3dC9QSys3ZDU4MHg4WEN6V1hCNFd3eGh4MjJYaEhCZUJGaE1G?=
 =?utf-8?B?T0VhVE5IOTd5QWwzYllaMzVwSE82eDdoMU1YRHFaTElRVUJrcmd2SHJISkN1?=
 =?utf-8?B?YjVoYzdNaSswbTFHOURYUVNKSEJSZFJOaS9sVnA5STgyT3pqNkZiMWNlOTM1?=
 =?utf-8?B?U2tPQXNTZEJWbERJdXhtalNMZmRqTnRyczYyN0lWNytTWUh5dE5EYmRKOHBy?=
 =?utf-8?B?aEUzcGdOZzhnbGJwVzV4V1FscHJTSW4xSjRmYk1ESHBTYXNRR2tkRmNlYVhw?=
 =?utf-8?B?U0RLZUlvaFlQb2FBVGFZcGdFdXlES2xYdk50LytKQS9ZZjhqQ09DcHp6ZmFR?=
 =?utf-8?B?MUczTmxFVEpjNkF0RTJzWVI4YkhXYklGTnZ4SUZUNnczdkFxRVUyb2RsR3pz?=
 =?utf-8?B?MFFpalZyWDdVWTRoMTA5VStpTmY5NjNSeUdoY3RXU3hlWmJEQUcyVGh3SGpj?=
 =?utf-8?B?N25mcUZaSUpaUXJ3bUlQbUZrMTdCQ1kwYy9XMytMZUpRMjNqVUhpVXJrWVRl?=
 =?utf-8?B?UUl4dWdHS1Q3NmtHckdWcnlKdHowekJ6czA3VEpMbmJTNFk2eHJudjB1a0VR?=
 =?utf-8?B?emgrTThLbUFxc1VvSHJRUTcxS1BLWDNKczNmYUZFT0t1Qnk5VVA4T1BZY09m?=
 =?utf-8?B?aG5POHFURGgvT1I0dkx0L2dvcWxjc0lyWXh1bDMzLzlYQmhLdU8xVi91bXdi?=
 =?utf-8?B?RG5PSW9KNUY2NGJXQkw1V0tlTU1yNGJpNXJBVldUdy96dUFGNWJHcjRUalFk?=
 =?utf-8?B?aFdvY2tWZUk4ZURzUVdxRjlIOEFIWGhKcU9CLy9SOFdoZDFGenRDNDh6WUVt?=
 =?utf-8?B?Y1BURDZlT1VheTg2UWV2amQyODBFYnp3aDVReGUxYjJTL3NpS2wxeWh2bUta?=
 =?utf-8?B?SGZPbFFoMm9ONEpUemxZQ3dDRFYxdnFLRE1obTQwQUdGVVBqMDB3OVkzK1BE?=
 =?utf-8?B?Q0lJZDgwZVBRSW4zV24zMlZYTWswVWlhenJHV3VRb2grVVhZcDdtYUlGTWdN?=
 =?utf-8?B?OFNDOEVoMTlydXpyZWFRUmZOVXJ0a3l4N3cvZ0RORXN6VGN0SHVOdXYvRktm?=
 =?utf-8?B?eDRjUUtsL3FwT3FYYiswbG4vMXlZb3ZxYnhSNDI2TWl0aHdvTnVtWDhKZjNM?=
 =?utf-8?B?KzNNOGhXQjVNY1NOT2I3YWFzYkk5QUNjZTUxS25BZm5TSHgwRU9TVVNMdE5Z?=
 =?utf-8?B?eE01aEJnYWp3PT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:33:52.0587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d512453-9d76-4e7e-afff-08dd775a677b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6669
X-Proofpoint-GUID: Zdhxw332fz_J8M5EmlDoVlUa6Z5Yof09
X-Proofpoint-ORIG-GUID: Zdhxw332fz_J8M5EmlDoVlUa6Z5Yof09
X-Authority-Analysis: v=2.4 cv=bYprUPPB c=1 sm=1 tr=0 ts=67f65b25 cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=x6dH4NT0EZ3sv_rvJ1kA:9 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On 08/04/2025 5:00 pm, Mark Brown wrote:
> On Tue, Apr 08, 2025 at 01:58:23PM +0100, Richard Fitzgerald wrote:
>> On 07/04/2025 8:16 pm, Mark Brown wrote:
> 
>>> This is fine but note that this is the use case that the regmap_field_
>>> APIs were created for, that also helps deal with things if anyone is
>>> clever and resizes fields or shifts within registers.  It's purely a
>>> question of taste if you want to use that.
> 
>> The regmap_field stuff looks like a lot of unnecessary complexity and
>> overhead just for 6 registers with alternate addresses.
> 
> Yeah, like I say it's a taste thing.
>

If you would prefer us to use it we'll make the changes.
If not, then we'd like to keep the code as it is for now and in
future we'll have a look at regmap_field.

>> (In fact, the regmap_field stuff looks like an over-complex way of
>> solving a non-problem. The original commit is talking about replacing
>> masks and shifts "all over the code" to make the code neater. But
>> really, all those extra structs and pointers and allocated memory just
>> to replace a logical & or | ? Every struct regmap_field has a pointer
>> to the struct regmap !!?! So if I've got 100 fields there are 100 copies
>> of the struct regmap pointer that my driver already has.)
> 
> It was for cases where the shifts and widths may also change, there's a
> bit more than applying a mask.  Like you say it's got some overhead
> hence the taste thing.

Yes. If we had registers where the fields were moving around then there
would be better justification for using regmap_field.
