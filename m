Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E777E4C91;
	Mon, 28 Apr 2025 05:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745816609; cv=fail; b=JKKGEjl/1ggA3DnqB0YDY2J8ApUaK8bohTO0vZh60SZWWn24dKAshek1C34iHqh1lrM42716uKZyaXgyH6T3R4oap5VvBNckYZODKfvaF/e/VzodBN07q6DoLmqEEqJssfRh3EjI0gVkzZoROrJtKTIcOwE8MApSnCL3qISTe9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745816609; c=relaxed/simple;
	bh=6uf1sVYNPICZNU6u4nVIX9BVP6tvqyoU09Wrsh6zJuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Py2wnkXgsUzIcmTDhr0OvWuQXXZ55sIgQcLF/FxuK/5Q6v0GXRRAcsn0ruI59AaFYFBwrezHxI39PIJjw3B6ylozGFCIYxr3It3ZuNUmnKw0PzhSclb8dDf2WJpzlKE7ME1XOfTD5w34/ByIl3YbTG0rw5/B1HTheBQ5ri+zsuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=a9EJmPh7; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="a9EJmPh7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CotjpV1FcW6wt4bPU6/EWUwsv1j3q2FuEgS174jy6eracToOpdpAmi6owiQtXnN+NxxdX0N9twP4xDpjPmDMT8WXBFbSAWLo+Vf8NECjJTQjybd+j/+YlmJGcO+HnSCtHpfUKOspY/4q8JYt8MMrKSvNzncCce9cnxm1vty0of6jcWeYMoWPxb9FhHt/voeZcKukUgLWSOXUreR2rhDBdNGhQXxbeECixYWc3qDisUe+YbMx0ess0ci05KIXsARh2xw7kfg9uvsYPQUmjZ6cWPUeh4IVDnWhTMbNugbfx3/RNu0rCkR9AwbWHD1YzSQTYcV20zhe+tAGWDfchZaMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG7ss1AX/SKxPo3XkyZA2yRz0cBlseYHrCxq7aWslIY=;
 b=D0Gi3ZBMG/I7q0V6UM1Sw76j6nt5InYjldPstpP/uN7qY9lcDfDsvaBjReQe1TP4aQpLUk1OKStco7vD2so5p9JDmnde2T7oVwBoGBoi1M4mqG34/iU+5sTtm/WS4z+Klf68xJeC5EhMkYkquHuZdwDIUtzQ9lIb2NBYZxIQWkVJeNF7l1rPTiz418nuaafxjFmc0MVVUVn2rmBtypLNWV12XZZroYPtF8J6qG/kCCDTkKP1Izgdy5BvXYPwh6Kpe4hLAffVDn9DJ5qngoEUa64QhcRqLHKE6K27xAS2py/aUHaZqsXtCIGcD6Eamb6WgkPRPqVPoxR2CdDY8plvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OG7ss1AX/SKxPo3XkyZA2yRz0cBlseYHrCxq7aWslIY=;
 b=a9EJmPh7nj5+9QFc1iJfA1aEhGba+E6w+EY0rmhUs8guPipP1V9VvlWHCAtCEY/BA0cSRhiBUsL13lOY0ZfTNttX6Zmc40eR8wUZ8RIjG7N/VOoX8b4sn0n09Hmsa0JeAGfsKQ0PX1Rlck1DDzZrVxR+fctCKaGyfb1FbC5CrsMNLVj2UfWR/J34q6mqfAVi5lsIP760KDWzkdN8HtnInFdgW8J2pZqN/ajKjfjB2RLxyCJlxbU1tuQHyxjUfaj202iHeJ9SIUFlTPwjD3c2VFIyIHFa36xtn0z1nWo267owPCf2qcIW8a7fB4boguq2DktoyyKjmwMMcducXLT8fw==
Received: from AM8P251CA0026.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::31)
 by GV1PR10MB6170.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 05:03:18 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::51) by AM8P251CA0026.outlook.office365.com
 (2603:10a6:20b:21b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 28 Apr 2025 05:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 05:03:18 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 28 Apr
 2025 07:03:15 +0200
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2001.de.bosch.com
 (10.139.217.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Mon, 28 Apr
 2025 07:03:15 +0200
Message-ID: <ee888c8f-4802-48a1-bd08-b454b782fff4@de.bosch.com>
Date: Mon, 28 Apr 2025 07:03:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
To: Danilo Krummrich <dakr@kernel.org>, Dirk Behme <dirk.behme@gmail.com>
CC: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev> <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com> <aAyyR5LyhmGVNQpm@pollux>
 <0756503c-02e7-477a-9e89-e7d4881c8ce6@gmail.com> <aA4ht5sUic39mnHj@pollux>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <aA4ht5sUic39mnHj@pollux>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C709:EE_|GV1PR10MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a0e1ac-807d-4342-32f1-08dd8611fdc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vzg5eDl4K3U1WUtxZi9ZanNSNzVxams2ZFAyVDgxTDROOG9CYy9VakZiUjEy?=
 =?utf-8?B?cUdKTmE1NHF6WW1XODkzNmNWK3BiME9WeUlqeWtiV3czOWRsS3NLUW1sYzBt?=
 =?utf-8?B?QW1qTDhoZXZjOVdScGtyVmc1d1hwRk1uQWhJZytNVEo0RnJ2emJ6VmVKdTNL?=
 =?utf-8?B?V2V4UEdYZS95SGlaOEVmNDNNSDBLemZ6bFBmYm9idzJlWDh1cVI5cXlqNVVi?=
 =?utf-8?B?ZDdsYy94Q0szOHlsN0pGQThGQVVDTlNwOEN0N09jckJlRUVIajMwQndMNUox?=
 =?utf-8?B?R3FEcVlMK3lzcU9LMTdCOXZ6Y09xdlpYZkZFdTNXTis2Z2F4S2syU3R4TnIr?=
 =?utf-8?B?Q3dIVFlDbi90UU85SzBqamJRL1RxU3c5Z2dRSHRHVUhCUDBBb0RMaXdDV3Rw?=
 =?utf-8?B?Um56Q1J5NEhzUk1WZ21URjVNWklsSVBrT3RDeWExQmozM3VOOGRkRy85Q1Zn?=
 =?utf-8?B?TU55VWVjOFAwMEdLemlzWFRsZ09EbEpYam5CaWFsRDREYkp2bWhyeGFZdCtS?=
 =?utf-8?B?STBucVJQczNQMnRWLzRGdjBJVyt5b2Y5S1BUQW9oWDBCcVQ3NHRFZUVHN0Uy?=
 =?utf-8?B?dVVjV0tUOCtGSW80dTV6dWNKMTFqM2hqb0xCUWF3UXBqNmJHazdZNm1GcjdK?=
 =?utf-8?B?c20yejFLV3JsNnB2WVFwNzBuY2YrOUFqcGhFenNZSXRtSmk1UzQrZ2hXYURj?=
 =?utf-8?B?cjJ1VWx2RWNWRXVaN2pJK2x0WlhMZVN4UXRxcUF0T3B2YTVzMmFNU1VCOXVW?=
 =?utf-8?B?dWd6ZGR3VWpyb21XWGErL1JXcFkwSG5OT25SYUVLN3FoZmdzMkFGUVdFM2Zx?=
 =?utf-8?B?R2FDUWd6RjhWNzd0UWQ2dFFwWE5sWWxaU1FqcUZ0TzV4eTlaVjV2b2ZtV1gr?=
 =?utf-8?B?NEVRYmRSa055SklENExIQVRIM3NjcHdzQWloVitRYWNKaDQ1bzltbVU1ejJq?=
 =?utf-8?B?QmNib0Q3a0JZRDVIaS82ZU91S0RVcWsyMkM1YjNUbmlobHl2MjNFbVAvWE9Q?=
 =?utf-8?B?QmdpSHhsN1VsRVM3dWl6R1E3UUMyWGlvTVR0emRqUnR4Y0I2Z3ZncGxyaTFB?=
 =?utf-8?B?cGRoQkhNN3poZGpUWDYzVjN6cFc4TWEvL3NVMnhuM3BIUlppYVhsU0pwaGlq?=
 =?utf-8?B?elVTa1ZlZjNoemlIY01WZjhrQ21NTUk4SmJSUTg2SjlhSXRGbVRGS2ZCdXRv?=
 =?utf-8?B?TUtBcFBvWEJqNTd6MTEyL0ZZYkh6eDgyMnJybHFFUXhaSG9DV2h4UW5TT1dw?=
 =?utf-8?B?RGxLdXlLb0RQRzNpTWI0NGhleHJvS21kSFYvVW5aai9SV3RhSnRvTEZITkpp?=
 =?utf-8?B?QzlLb0R1TjMxZGNCbVhjNWUwR2NidTlYWWw0UkdwMWRwK01zcDRYcGg1SzVX?=
 =?utf-8?B?UlM1a0p2a2h2R1lsL29xZmxoVmV2a3ZTM0dXZFVyWUthclpnU2N4VkQ5YTNy?=
 =?utf-8?B?V2lvaWhRMHhRU0NnVkVicGdnclNZYkxLYjZNT3cwS1ZjSVBwaG1EMWdQU0k4?=
 =?utf-8?B?aWNqQjM5d0V5eVFkckVYTldUM0xvMk1EMEN1WU9NbUZ5cEdTVyt3SGEyWU1B?=
 =?utf-8?B?WUlUbEpoZ2kvbjl2eXYwWm4yMUdRRG9CSi9rNHM2ZWI2OUhWQ0FoM052VXBn?=
 =?utf-8?B?TVR6dUZ2SHIxclBhS1k3TFBEaytzcndhemxBNkdnTnRDMEh3eDhDZ3BNV0Rx?=
 =?utf-8?B?NklkaytBYTRxaHJUVmxhTFhWZXlIbkxzampFdzVlUWI2NTE1S1hoOWxhN053?=
 =?utf-8?B?a1pRQVBPeFBpUGJwem5meitTc01MSXNLa0lFMjcrZ3FSc2lSODc1em40WE5G?=
 =?utf-8?B?L0Vid1RkSm14UzRlNGplSE9ocCtOS0g4QjJtR01jZGRQcW4xbUJEaUtpQlIr?=
 =?utf-8?B?U2FFRGpzenRpSXh3SDlCZkExU0dRUW1jbGp4N0lPYUFLM3o0T2Q3ekZnSFZE?=
 =?utf-8?B?K0dLZi9GVGRoRS8rbDZUOUlFVkVtNEw0OXRpNHBPSGU2c2dXdmx3Y2ttd0t4?=
 =?utf-8?B?NkhFeEpQeklwZ3FidXF3ckMvQjlEWXk2eVFoMmJ3NFJ5cTFoSUNXc1E4eGZm?=
 =?utf-8?Q?QR3zuo?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 05:03:18.5782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a0e1ac-807d-4342-32f1-08dd8611fdc2
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6170

On 27/04/2025 14:23, Danilo Krummrich wrote:
> On Sun, Apr 27, 2025 at 08:11:58AM +0200, Dirk Behme wrote:
>> On 26.04.25 12:15, Danilo Krummrich wrote:
>>> On Sat, Apr 26, 2025 at 08:19:09AM +0200, Dirk Behme wrote:
>>>> On 25.04.25 17:35, Danilo Krummrich wrote:
>>>>> On Fri, Apr 25, 2025 at 05:01:26PM +0200, Remo Senekowitsch wrote:
>>>>>> +impl<T> PropertyGuard<'_, '_, T> {
>>>>>> +    /// Access the property, indicating it is required.
>>>>>> +    ///
>>>>>> +    /// If the property is not present, the error is automatically logged. If a
>>>>>> +    /// missing property is not an error, use [`Self::optional`] instead.
>>>>>> +    pub fn required(self) -> Result<T> {
>>>>>> +        if self.inner.is_err() {
>>>>>> +            pr_err!(
>>>>>> +                "{}: property '{}' is missing\n",
>>>>>> +                self.fwnode.display_path(),
>>>>>> +                self.name
>>>>>> +            );
>>>>>
>>>>> Hm, we can't use the device pointer of the fwnode_handle, since it is not
>>>>> guaranteed to be valid, hence the pr_*() print...
>>>>>
>>>>> Anyways, I'm not sure we need to print here at all. If a driver wants to print
>>>>> that it is unhappy about a missing required property it can do so by itself, I
>>>>> think.
>>>>
>>>> Hmm, the driver said by using 'required' that it *is* required. So a
>>>> missing property is definitely an error here. Else it would have used
>>>> 'optional'. Which doesn't print in case the property is missing.
>>>>
>>>> If I remember correctly having 'required' and 'optional' is the result
>>>> of some discussion on Zulip. And one conclusion of that discussion was
>>>> to move checking & printing the error out of the individual drivers
>>>> into a central place to avoid this error checking & printing in each
>>>> and every driver. I think the idea is that the drivers just have to do
>>>> ...required()?; and that's it, then.
>>>
>>> Yes, I get the idea.
>>>
>>> If it'd be possible to use dev_err!() instead I wouldn't object in this specific
>>> case. But this code is used by drivers from probe(), hence printing the error
>>> without saying for which device it did occur is a bit pointless.
>>
>> Thinking a little about this, yes, we don't know the device here. But:
>> Does the device matter here?
> 
> If the above fails it means that for a (specific) device a driver expects that
> a specific property of some firmware node is present. So, yes, I think it does
> matter.
> 
>> There is nothing wrong with the (unknown)
>> device, no? What is wrong here is the firmware (node). It misses
>> something.
> 
> How do we know the firmware node is wrong? Maybe the driver has wrong
> expectations for this device?
> 
>> And this is exactly what the message tells: "There is an
>> error due to the missing node 'name' in 'path', please fix it". That
>> should be sufficient to identify the firmware/device tree description
>> and fix it.
> 
> I think we can't always fix them, even if they're wrong. How do we fix ACPI
> firmware nodes for instance?

So the argument here is that the device (driver) is expecting something
to be "required" is wrong and might need to be fixed. Not the firmware.
Yes, ok, that is a valid argument. I have a device tree background and
there in 99% of the cases the device tree needs a fix ;)

But let me ask the other way around, then: What will it hurt or break if
we keep the pr_err() like Remo did? Even knowing that its not perfect?
But knowing that it will give at least a note that something is wrong
with at least a starting point for searching what needs to be fixed. I
mean even if we don't get the device, we will get the affected node we
can search for which device uses it as "required".

Could we somehow agree that in 90% of the cases this should be catched
at device (driver) development time, already? And therefore it should be
beneficial if we don't require each and every driver to be "bloated"
with checking this individually?

Dirk
