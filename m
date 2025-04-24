Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013026.outbound.protection.outlook.com [40.107.162.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA53FE7;
	Thu, 24 Apr 2025 05:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745473686; cv=fail; b=ZUMZxqVoCXxRdoCMRJAFkO6J4SNP7OOY6IXDghaenyYKhnhWpqh54cc8Vug2AkTd+zihYvCWdKb/fb0+tCsf2jr87Q4VTusbmgrmw6p5yGzVGC0Kw5DMlOqb5yx80zwrrtK3zHTSnOHfAy2QUrElJbfzeA8F9N5c9p/MGVqcY6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745473686; c=relaxed/simple;
	bh=x57ZSiyvyd3/Qs8s+gYV6VjG3nZXWEOD8oBTBSrhh14=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=OGE3RhIu2Ly430uug6LnQFi+ZpA7zJhmCoKwY7rCTpEit0fQx417QKGeEGNux1NLTrx35Qp5QYhmwYztZgvjx23FixI5IOr3/UIKT+hTbOkIjrh2CcsY7paMLeug2m+DJ3iHT4gu3fsPdKR2k3eh5LsjTeJL5rQo/EBUn8aOca4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=cq3SZJP+; arc=fail smtp.client-ip=40.107.162.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="cq3SZJP+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULFzB+cqYRpSDpPOTiQkx/dQRte1Xeb1qy5kxBnrtqky7s/TdUUh7D93/iu8qcqJ2eILzz+ccEyFrcD/QAXuX+r6oQIZBMIU1FpIOtn6hii1tH+T1cJlnP8WeiIUG6a3wzSq6MjtbOjqQQ2vA1hqj6JadPyeQaFY64cPJhwtJl9bQLcG3jBKvRoXIHxQ5syqtwOaU1ts2OlcN06r1KwMP4SInb8vOvWikQx3R8Zva0i2Y2rL1IfpLqzNddeT27FwDEpkFCaKE3DUeHLEGEEIrEnFrA6YpC6nL+NxP/n/7m921PU8JSBesF70wOOyd7iPY5c4QGoRWq8VrGZJfi3QFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVYT/gKDmVndH9BNl3sr2BoI0AVXQO8NB9jPjFRLOV0=;
 b=mj2e+9wj4vvDxvLASZtdJiscGBaD/2+M+CdjeFzrjHNVy/6WKOCA9QI+KrI0HV1MZjwtLI9XpLgt6QwpQAKDenZBpD/v+SJ8sg1upLQDX8T6+1994jMQxNZsOS7IMmQL6LxVrCfckB074ViglCXye7+F16YkfqcPN4McmDXjIMRH2+qLNdQZUOif7UQXYmog1ttHLf8vECLLb0/sAXA2wAbb9XT0XJkdRH8xbiJ6O/niILjXxnIX4hQ6RpnOouxJtSqv0QLyZFkP8E5l+MYL7OAhIOVIN0GI4Czp/IkSSAdQzl+BWT4I/qvAsNkAKhSiY9eScQLwQvFBVX2nN4OwYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=buenzli.dev smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVYT/gKDmVndH9BNl3sr2BoI0AVXQO8NB9jPjFRLOV0=;
 b=cq3SZJP+rKMVLLoX5MTRsKPUa2B8MytDRCUzIy9keGIQPBHGOnhHNOY0YjgBJ0t5R25uG40aZPw1NPW+QScT9qW+U0qyGDzICNsL5IFo2+l9wmiXzlxMcIKHY5/V/crmiGk1DLTwR0Xh9ad42nZ6/SYs4RO2TeIY6t+VriiRk3Y227VorFbsRfPKlB6L9/lMEKgWfKeLOx6xVBDCJWcPi+uLYV4Qs/vPzy+/sZqgszi1F2Wk0RxoMrbkJocKMP0UTNPwLUN9ETQ7zAAwA6eaDF1zOMIw+63aA67y0Q2F7+dNguPU91a60Uk072HcLL6RRw8XgGiFKjsJElgN/dhQEw==
Received: from CWLP265CA0532.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::14)
 by DB9PR10MB5883.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:397::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 24 Apr
 2025 05:47:58 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:400:18d:cafe::cd) by CWLP265CA0532.outlook.office365.com
 (2603:10a6:400:18d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 05:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 05:47:57 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Apr
 2025 07:47:50 +0200
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Thu, 24 Apr
 2025 07:47:49 +0200
Message-ID: <9f08de79-4550-4b85-ba36-9615a300e32a@de.bosch.com>
Date: Thu, 24 Apr 2025 07:47:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 5/5] samples: rust: platform: Add property read
 examples
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-6-remo@buenzli.dev>
 <cc50edea-08b2-4507-9410-935f8aac6f62@de.bosch.com>
Content-Language: en-GB
In-Reply-To: <cc50edea-08b2-4507-9410-935f8aac6f62@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B0:EE_|DB9PR10MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 1595a157-2af6-4c9c-170b-08dd82f39119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVVrVjAreEdBaUlCRllPakZWMXIvWGRKNzRpYlRQMGRLVU5oUGIvR1h6dHRk?=
 =?utf-8?B?ajFNb0pBZ3lZMGZ4UEJkV1RvbmRMajF2QW1yVUMrTFk5VEcrWWhZcmVvYkNk?=
 =?utf-8?B?bDBSYmNQM1JUY1dIOE9nNkR6VmNEWnhjL3lVN2M2N2dSOWtMOEwvOW5BOFYz?=
 =?utf-8?B?UmZRSkVoemdHOHppVll6Sk5nNmVRKytWSjNRNkJydHVMTGtwRHVQaTlqZFA4?=
 =?utf-8?B?WHNBNEhFMStOcUg2SVA1amFSZU1oNFI5WS8vSUZaR0xzZlZHOW5yQWRnWFhD?=
 =?utf-8?B?VzZ0djZLK3hlZTZoT043bkVJODZJcmxqUWVmL2pWdTNTQ0J0RGJ5cTFYVnpj?=
 =?utf-8?B?TDJQUlU4Mzh1Ull0QjNsbkpHTnFtY1E4eE5lRWlNSlF2VG5CajlieXNhRitI?=
 =?utf-8?B?L1ZSbTZ6TkZrRzY4TWFCN2hiL0VRZ2VVY2pxQlp5SXBHRjVqMjlQTjc5UjVl?=
 =?utf-8?B?NEsxSmRJa0U4RWZtRW0wTEFLdlYvVHVkZU9jdTZvUjh3SFljNWJGUzV0eS9Z?=
 =?utf-8?B?d1BjZzdJNnl6NkRyNE16QWFhcE5JSGEwMFFpYzNUMitOOWswSnNKcnBlSWVj?=
 =?utf-8?B?cnY2WGpCUGE4TjIvZkhCa1Vac28xRldZaW9EdE9mM2VvRjhGS2JQV29ON2RS?=
 =?utf-8?B?WWQzejNzeHQwbkZ1bTQzNWp3bEQ0TVBGanpicG1wZi9EZ0VGMDFrUm04bHow?=
 =?utf-8?B?S2J0MGl5TC95V3BTeEJBK3ZZczhiMzN3aGI0TnFJTWsyV0ZZQW05QWVmeFlv?=
 =?utf-8?B?TXNPR3RJUkg0L3RBeTR0dEZrckVpRlI2UFQxU3hxK25HMnZaK2FoRWQyLzkv?=
 =?utf-8?B?NDZ1bi8vQW9PK2lJQWQvVUFzanRMQ2JCbDRHcG5wVGNGQ2pJaXFuazBWVUVi?=
 =?utf-8?B?VmVVNm1aNitKSjNXMDhtK3QwWWxSanIrb0RJczF0WiswVEh3T1ZTZEcvMlcv?=
 =?utf-8?B?b1A3Z3RjWkcwM2tIb3N5QWs4VWlaL2VUVDd4NEV3N1RtRTVIYy9ld3FmZEpz?=
 =?utf-8?B?VU5XZ252Rms5Q2Y2RFlLeWpsZ2hxUUZCQnN2UnczUmhmUUdPeHl2aWZYWjNE?=
 =?utf-8?B?MTM0cGkyYkFUYUR3RmdZbmR0T3RMb0RaM0hrWEsyVWc3SGRWRWFHMTAxRzdQ?=
 =?utf-8?B?d3YxSWlKWWQ2anJORktsL1J0RE1FTmYrMThibDlzVkZMZWpmRUl3N2tOYnJp?=
 =?utf-8?B?QTFmVGprckhpM2RXVU96Nzc0WHNqcElvRXg0WjRkYXV0V2NUbnFNVXVyQVRk?=
 =?utf-8?B?UkxsTHUycUo2c2NNd2pjdG0xb1BtVFBwZ0RaUnhRUUI5RldpUnNnUk56MDA1?=
 =?utf-8?B?OC9iOW8rMVVwcExUanRUOENZMHRJdjZ4WmN2NXIyU0pNQllhN3Zld1htUjZQ?=
 =?utf-8?B?TFA0OENaclErWjBTVk5UbkEvL3R3dUY0aFVERjRpOEE3ZW5oaU1lOEI1VW10?=
 =?utf-8?B?OG5JVElQNldZMDd6cU1jUEtjdVNZSW94UnNrZ1lhTXJTUHZyZlRzaG1ESndx?=
 =?utf-8?B?T1JkU09aR1prVkRBNVVLdkl3YlNXeWRxeUNGZFlRSW5yeWJyT1pSTGt6b0sx?=
 =?utf-8?B?MWM3K2dEMzBCaTRYQm01T21rVGlZdWEwNHRLR24rb0tpaktqSUNNei9FYzQy?=
 =?utf-8?B?amxnYkk2OFhHcmh3YjV2QWVIMTZvZ2F1WFVVRkF2dVhlSjQwemNaaDhlNTha?=
 =?utf-8?B?akpEdHJjRVZ3OURvNmFHTVRGeUxzeXFQZGxZRTNPSDc2SmorL3lyWVJJOHJI?=
 =?utf-8?B?YW56SUEyenZHSE5BVC9SZ05kb3h2MTJoMmxaaXVrVDd1anA1bG9kVjJFOXZS?=
 =?utf-8?B?REtuWDhPOWwrY01neTVnTVZ1ZjIwRUpEWkViUExvTytBREc1Vng3NGNFakJr?=
 =?utf-8?B?VEVHMmwxY09mZTRnMUFLUkdSZmJGZ25SNDdwd3dSckRHbHlJVTBPT0xrZDI5?=
 =?utf-8?B?QUJMbEhOa1VhYU1Wcng4bDJOWXFhUlExZDM3WkwrYUNZRmJKS1RNN3FHelNj?=
 =?utf-8?B?N3VodUdORXdNMllXR0tER2cwWUp4ZGZ2UTlKanliaHVtRlNlNDZ2WnZuamFt?=
 =?utf-8?B?QXIvaU5VTG5oYmJOblJiZlFwamFRS2pyNDBZdz09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 05:47:57.8857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1595a157-2af6-4c9c-170b-08dd82f39119
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5883

On 23/04/2025 14:39, Dirk Behme wrote:
> Hi Remo,
> 
> On 14/04/2025 17:26, Remo Senekowitsch wrote:
>> Add some example usage of the device property read methods for
>> DT/ACPI/swnode properties.
>>
>> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>> ---
>>  drivers/of/unittest-data/tests-platform.dtsi |  3 +
>>  samples/rust/rust_driver_platform.rs         | 69 +++++++++++++++++++-
>>  2 files changed, 69 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/of/unittest-data/tests-platform.dtsi
>> index 4171f43cf..50a51f38a 100644
>> --- a/drivers/of/unittest-data/tests-platform.dtsi
>> +++ b/drivers/of/unittest-data/tests-platform.dtsi
>> @@ -37,6 +37,9 @@ dev@100 {
>>  			test-device@2 {
>>  				compatible = "test,rust-device";
>>  				reg = <0x2>;
>> +
>> +				test,u32-prop = <0xdeadbeef>;
>> +				test,i16-array = /bits/ 16 <1 2 (-3) (-4)>;
> 
> 
> Is "test,u32-required-prop" missing here? See below ...

Ah, no, sorry, "test,u32-required-prop" isn't there intentionally to
demonstrate the error handling on missing required properties. In this
case I would propose to just remove the '?' to make the sample code not
exit on this intended error:

diff --git a/samples/rust/rust_driver_platform.rs
b/samples/rust/rust_driver_platform.rs
index 01902956e1ca7..b6cbd721a8882 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -75,7 +75,7 @@ fn properties_parse(dev: &kernel::device::Device) ->
Result<()> {
         // Missing property without a default will print an error
         let _ = dev
             .property_read::<u32>(c_str!("test,u32-required-prop"))
-            .required()?;
+            .required();

         let prop: u32 =
dev.property_read(c_str!("test,u32-prop")).required()?;
         dev_info!(dev, "'test,u32-prop' is {:#x}\n", prop);

Best regards

Dirk
