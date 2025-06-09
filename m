Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5CB1DD9D3;
	Mon,  9 Jun 2025 19:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749498602; cv=fail; b=OqHdoTweBCaiXUVFdbBKfDkdOGYMfy6l6UA3tcr2oq6Okcxo/fp6Y4FvrF+0if1pgKX0za5ee4xl+7GudeGmmWxG2gH3QlNWuj7feELmnIiZg5O0yU5XqdZCJmjz/7XaxMr13/rdJ7poc4X3Hrmiey8AI8UqRszEWC4/BrFXWGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749498602; c=relaxed/simple;
	bh=7LcR7oazIKD6q5wn72TareS84PIg1j7DfA/C0H75RuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FS35Fd2+PfPMXK2nDm/ziJKyw/KmpXyO+0XsYJhh1Bi3dYxGYc3D+sDU9SFLdzsy4YVQ4dTSzuqRXJzaE4SIjf4goHnWqLt4D/+8O6Yi9sHAyXIz0mnuPh47ZhDEUF+fFZmI/QSSFBV/RLqEH+0oAgL1/4oSsRQZ7Gp9EO+Qc4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P9tBTUlE; arc=fail smtp.client-ip=40.107.244.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P9tBTUlE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JF3vwbjuSxHUtRmp7rmAdfx6jvr85PqmW2AB90V7x9o46ctOdOvazA+Avm97Z1RH+Zt41xIgEwy71wyl2SPJ9MhdgaNI2t67KvNw4Ru0regeAC8ktuM7c5m2JuDuH2n2N88Ownw57aKxWE4KOjcPHPYjF0IIzUTxE4zBK/qNZs0osZxfVmA0C20jM//M48l2mARIigpFkk7UhnRbdNrLmITvA3HF31e6JE4g1a9e2FDE00wsPaWhul7qrZSjqUX0oPikznwa6TlAWKN6eUKsuEeytPumfh7xU2mCsxythbBQyFhRBsDiMqvs3hcJZ5TXpLFNYVyeZkv224cbzobHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQP0Yp0yKwNxHfQZVaMKASwu+NEDSmcj68w9+jXhw50=;
 b=y9u5LvVPQ7d2R5NNi4oKoDrGd0pR0GISbVL2/hBJLXEE6EOHLUtR7pQ/5pz/o8D2dxZvpuR7gF1ovksRdaSTaPIzo904v5NdpUazXTloGpvKdNdbuIY33Zr48H9wjSfQoc/1zMXr+nCAscT8c0Yhvi56Jpm3YMq7DXAz4uvSqyYcZki9q+8dfVzVPhpqD+mKNzX0E1UFJQdXXC37NIR+5CMFmdPepYA8ksmE/cKhzrcV2DsSSxHrYErGxtZlLvUZqj22Rospr0KdCp1QQIKZwb8KQZKX4rSyPg+7rQ+BdEIL6UKl5y286V+KwQX91DAhp4Eq8E8SFWNkvMii5NefNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQP0Yp0yKwNxHfQZVaMKASwu+NEDSmcj68w9+jXhw50=;
 b=P9tBTUlEYvJg3XaKqGvAHFBAHvkV61p7Fh0hZedq3Cdl6JvkapCyC1CrlvWui7a9PTNjFq9QIWSBeJjRShbplbVKx7osJYUZF/Xlfbmf3LpVvuPRzXCbucI3elhtNSkdhgnbqC9BEYIecU/3ftJ0dG2BncjMYxvat4V8C1A8jdxe8b6vru0asfjnzSwo55ZBFLov94n7bHTi37QarInKZ850Oep0WmSfdyH1J+/EX5rBl3D/uGzOwHUussRmw2FR+62s6VPKAO4xIoIsuoMdfdt9gPMaKM+X/k45E1zKk5Er/cpullrTE668z1hmAzssQLjzoXWeSsbHc2vL72qspw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY1PR12MB9581.namprd12.prod.outlook.com (2603:10b6:930:fe::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Mon, 9 Jun 2025 19:49:56 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 19:49:55 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Usama Arif <usamaarif642@gmail.com>, david@redhat.com,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, Juan Yescas <jyescas@google.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Date: Mon, 09 Jun 2025 15:49:52 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <2338896F-7F86-4F5A-A3CC-D14459B8F227@nvidia.com>
In-Reply-To: <f980e652-8e2a-41da-af9b-39fdd439fefc@lucifer.local>
References: <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
 <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
 <B2F966F0-8F5F-43AB-BA33-BD3E65504F4F@nvidia.com>
 <61da7d25-f115-4be3-a09f-7696efe7f0ec@lucifer.local>
 <AA2C4D68-B1DC-48A6-A807-56516067B9C7@nvidia.com>
 <f980e652-8e2a-41da-af9b-39fdd439fefc@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:408:f6::23) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY1PR12MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: e443130f-4cbf-4e79-0178-08dda78ecefa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWpaNUVxN2x0TGJkdVhBQThYUGxZZW1mRUhSc2FzRHBBTENaU2NvZXJNc3Qy?=
 =?utf-8?B?SFhvYUlwWmtuWVFJazJwalFBQ04ydXJCcGlUb3IrZ1JvN2p6MHljd0NCVGpl?=
 =?utf-8?B?MEx2S3J5WU4xVEdFSzBhRTFNL3VwVHR5UVF3Q0Z0dHZxczI1Zmh3WWhPdW9o?=
 =?utf-8?B?ZzQyOEZIb0tUQTRTYlZOU2gvcXgyQm4zM1RoYzNwaDlwTFEwcmJsanRrS1JZ?=
 =?utf-8?B?R01pb0pyYnhPYUJ5Z2RXQ2thSmVNeld4ZU1kOFFNL2FobUhpc0thejJMRjdC?=
 =?utf-8?B?OWJDc3JhN0dDOW5BVHZhcE1xNkw1cFVjOXYvV29kYlFZNDJFQnNFRHh2Y283?=
 =?utf-8?B?UXR3Zy9NME11d3AwS2xjRE5TY0huWTd2VEtMZndORm5NUk53TWt5WTNmcHhM?=
 =?utf-8?B?cm5GUmNkeVdVeERaSUNDZlR4WjViYlNjRWlNM2RuZStEaEg0Yjh2WGs0d05x?=
 =?utf-8?B?VjJOMncvcGJxN1BqYkdlRiswd25qTWhOcVZnVXRIWW16T0x4SzV5dnhBZDJw?=
 =?utf-8?B?TkJqczl5SDV5Qk1STnhYTnFLMEwwSFN5Q1J6Y2IyWXJ1UHFQcXB0NEVmM3hl?=
 =?utf-8?B?ZTZ6MmhOK1hRejVpcVMvazZBMGRydzFmU05Xd2dPWmgrS2NPc1NycTczZ0Mw?=
 =?utf-8?B?Z0JwN3A5MlRaSTJ0a1BmeUF6SE5UQ1VROVRrR0ZRRzNMMU1YaWVsaW9ITzZt?=
 =?utf-8?B?Z1lZajgrY1lWNVhqZVhmVktER2dLbmQ5bGk1dzViNE10SksraHdtSGNQYThr?=
 =?utf-8?B?TFFJVHVubGpyMVhnR1BsZlUwRFczUW9jTHplWmsvOU5qcmVzMWg2OEFwVUxS?=
 =?utf-8?B?c1B6VDNkUEtwTUVES2dpRzh3dDdaZDh6WU1lMmhibDFzSlowTFFyU2tCN2t1?=
 =?utf-8?B?OWwwRUJLYk9sQmNpZE0vUzROTCttdDQ0YWduYTY3VDhJMS9sS0pDK3VRSmJS?=
 =?utf-8?B?aGU5TTc0Zm9YYmpxeTh5VHpDVEJkeGpmWTQyS2xOamEwamtOR1p6VnJyaGhj?=
 =?utf-8?B?ZHBuY2ZxNmlTbGVrV1pVRFpFNHp1eWZId3ZKbkYzY3RTd2F2bEgrTGhOSG9u?=
 =?utf-8?B?WmIxODI1OEtwMmppNXlXQlBGZmxVMUxZV2lHUHRyL3RqZUYwdFlJR2hqSWlV?=
 =?utf-8?B?UVJ1TXJuZmMrd09oQmorVXZUb2NkS0U3TUNsQ0tkbG1qL2tUT3haV3pHMEd1?=
 =?utf-8?B?WkEzbVdDdlpJNmxnS2Z1YjlVSmZsYlNScUxINGxyMUREd2QwL2RwTU5HckxZ?=
 =?utf-8?B?TjUwTC81MHNac3cxTG9USGYydjF2TWlmS25wNnpGTFhuRE5zeVE0d1lZdXA5?=
 =?utf-8?B?Vlk2eHpUNFdlMkxkSDdVOW4wc05NclRtUThySU9rRFA1RDRDRm9VRTNpMmdD?=
 =?utf-8?B?bEIveVpJZ0JHTnFCeEMvZ3Q4bWs3dkE5RDNUQ2lpUVF6WnJrUkUzcGxkYm1J?=
 =?utf-8?B?L0lNTUlQWk9wSFltRW40UTZWMXI0eVg2b0h5WWNuKzNzcnJDOTVIL1F6UlFO?=
 =?utf-8?B?eHRLVFJva0dhOGcxOGVxQlYwZTZLbHY1cGtOVGhtSmZVejZjc3JOOG1CQnNi?=
 =?utf-8?B?QkpSbTJFT2Z2R3k0M1ZuVDlGQnZGa2NseW1xcHB3bGp6OGJGT1ovS1hncXdi?=
 =?utf-8?B?TWJqeGYxZ2hxOWhGN2orOEhEV0FXdXQ3bzE0QVBidGNPcVRNTFVXQStjUitv?=
 =?utf-8?B?Z04vVzBsek5FcUF6b2Q4SGREM3prbEY1Y0NtSHJ4K2xsRTZrR3diNDRORFd5?=
 =?utf-8?B?U2RTSzc4Y1BjbklIcHdnNG9PZzBieE9RNXd4cEpDODdtbW85ZVNVT3piLytG?=
 =?utf-8?B?QlR4KzBlUHJsMkNJRW5wZFZ1cnFHUUJtSThoVUpJbEtoVDZMUysvZ2FiTitz?=
 =?utf-8?B?TXFiVUkzK01iSnhzNVlmMnZ3OVQyK3hDQkxjbk1OTXhSUDNMYThpaFRFNDBZ?=
 =?utf-8?Q?fv+m7j0WA6s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzRLQmJudUY5c1pCZWkvMDI2NTVSbnBVN2xreWZXVjkwUG9EZ2haZ3BxY1Vi?=
 =?utf-8?B?VFN3TC9nVlZCdmpRT0hEWFRMSndQNkdjWW96WkFiUDUzSXdhZG5GMWZZdFRY?=
 =?utf-8?B?QlNtMnVqMDlwc3Z3S1dPT2lyQk4xVUdHMk1FcTdmOUdRRVZSWVFOS0ZpZHZH?=
 =?utf-8?B?YXlKaWRmcmVCUUdQQlBQVzFlN3dMQU1uYjJRMGVuK1BrUzB2THNnbUxMSnNC?=
 =?utf-8?B?M3VEL3gvc1hxQUJWNStLRE5iS0lpcWZIZGNEYWl6YjF6UE85aE1NRmFBcU5U?=
 =?utf-8?B?R1Mvam43dzlrQW1SVXFoZ282ZWtXRENUVWtTNlZrSjB5Z1pXeFRPdExVM0tC?=
 =?utf-8?B?Yk1PakpBZ0dUUnp5THNBeUFUMFNtU01hTkZvV3hGRXlBV3lieEcvQUsxc1Bi?=
 =?utf-8?B?eGx2ZE5nVDEwcExpTWhCZy8xWUFidk1uQnpOemR3RjNKb3N1WG0rbFpHdXpv?=
 =?utf-8?B?VmpLdTZ6K0RXRmt1SlpDOTZhc3BaRmlKcmFjNGM3ZnRabHYzWmRHVk5na2wx?=
 =?utf-8?B?QUFOZUgrODQwa0ovNjB4Q21sMjlwanBWclo3MVZjc3pRcElPaFVnVXc5RmpO?=
 =?utf-8?B?NmRjNHMySjltS0U1elFCSlJ2aDNZZGpMZmdQY3JzYUtyR2Fmb1VVOXYweFZX?=
 =?utf-8?B?YU1WTUZBc2d2blpoTDMxVEdUV3VlOVRZWHR0eTFDRVh2bEpCcG5LajB3VW1h?=
 =?utf-8?B?ZmRKTHNSRFFHRlZqUXdHWlYzOHJYNkFWUUlvY3hXUkdKbWcvemQza3l1MDNr?=
 =?utf-8?B?QVpzai92a1dXckNnUUlnck9uOTl6b0RrcHdweGNVOUJDOVNIZkdMbGxaUWF5?=
 =?utf-8?B?UnhxZVNyaWJ0ZzFXOWxUUWVNZ0lWUUFGcFFuOFV1SkVnL0NjY3dFNFNEK0NK?=
 =?utf-8?B?dkUyWTBCVzV0blprbkY5MHpqWmtyU2xvNThsb3NtQzBZeHdxemRpa3l3cG1G?=
 =?utf-8?B?SDI4VzhINE5pSmNQU01TYU5XVnVWTENJRkVoeTA3eGNmY2FIUmc2MnBYZGdu?=
 =?utf-8?B?eXRyaTJIb3c3WHZhR2draEdSL1A5cHdHWi9xVHJQWnk1Wi9oNmkrMTIwQmpV?=
 =?utf-8?B?TUFXVXZVZjdEeWU2YnRHMC9XMzF1anlNbEg2K1ZyYXZtQ3JGb3ROTjlSWW9q?=
 =?utf-8?B?ZWQxcWJtMlBTTFJuUXo0Qm1lRHBHL1hwOWxIVGRscUsxa1RTTElWaGRFQk43?=
 =?utf-8?B?NHpjMENzdndTUjVZNktTN3NuNmI3ek8rSTk0eC9QTTRDd1JKRHBjU0tBckRQ?=
 =?utf-8?B?TWtZRWI1Vm1mdDlvNmJMYnNCYjRiOFdVUFRDUjRjcG1BT3pxY1VMdS9pZjJv?=
 =?utf-8?B?dXNmSUsyZ1VMSHErYlNhSWxCbzZ0N0NibWJ4YVY2VE1FVDhkZUFIR2FNMjB6?=
 =?utf-8?B?NWZPUG41aU9zQTZ0ZXRMRm02MlU0Yk9LUkxNWFdqVmRyNm0vQ0VxdUIxTURH?=
 =?utf-8?B?SUpLZ0U1NS9BcmpiVU9IS1prN2FPSjlocGtZR3JzN0UrVjhHQ3RkUmdYeUxU?=
 =?utf-8?B?eWRDMmFkRmxXTCtrR1RZUWR1WHBJd2FCZklYNkExOUV3cG51bU52OFBYbjhO?=
 =?utf-8?B?azB5Q0pzMmFjS0hLazlYd2g5ZmNJalBuOVB5OFk2OHh5MFR6WHFRbXFYSWRQ?=
 =?utf-8?B?QzUrbUxkNzhVdm1tdkYrRzVmU1RwNW5VUnJMVlNWQ1lnQ3R2b056amtJN2V4?=
 =?utf-8?B?YmlDbXdNeUdwWGlreHZwQ1VSVFVOSVQ3d2FGVG9Ed25na2xYRlRPcXIycUFP?=
 =?utf-8?B?U1hYaGpGTlZaa1BibW0yeUlIWkZvdzJhQml0QXBTYXJ0UFdtb2JUM2xvQndl?=
 =?utf-8?B?VG0zdm1DVDU5NU4zbkRVMldEd1AzRC82VWZoRVlqN1g2UW5yQnVxMDJjK1V3?=
 =?utf-8?B?elBIdnFQMUFkUXAvZDFucStxZUV6YmtEcUU2TUw5cWVsZzY0UCtHS0ZWNVJL?=
 =?utf-8?B?MFFUTzMyeElSZkEwdVBRMCtRNFF4dVpXYllqZnJGK0FqTEZHNXp5blB0VjJt?=
 =?utf-8?B?UXpJeXJLLzdGU2JtWXFJRTFVMXdJYTUrakh1NWZ0Q1JwMmhSZnZvVk1HQlQr?=
 =?utf-8?B?VGtRQ1ZsdzQvc0I4UlJyM3cxZkd4UnZkbUJnS2F1T1lLUFhqUFNxK2JleHRY?=
 =?utf-8?Q?FkAa69QBkfyYSdMHwtB8J2wT5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e443130f-4cbf-4e79-0178-08dda78ecefa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 19:49:55.8251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBwyKQLJcIO2pTRBf5yf5YcsCtHs9uO/d83btufsVFr9ldQH6rtzp5kITstAma/i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9581

On 9 Jun 2025, at 15:40, Lorenzo Stoakes wrote:

> On Mon, Jun 09, 2025 at 11:20:04AM -0400, Zi Yan wrote:
>> On 9 Jun 2025, at 10:50, Lorenzo Stoakes wrote:
>>
>>> On Mon, Jun 09, 2025 at 10:37:26AM -0400, Zi Yan wrote:
>>>> On 9 Jun 2025, at 10:16, Lorenzo Stoakes wrote:
>>>>
>>>>> On Mon, Jun 09, 2025 at 03:11:27PM +0100, Usama Arif wrote:
>>>
>>> [snip]
>>>
>>>>>> So I guess the question is what should be the next step? The followi=
ng has been discussed:
>>>>>>
>>>>>> - Changing pageblock_order at runtime: This seems unreasonable after=
 Zi's explanation above
>>>>>>   and might have unintended consequences if done at runtime, so a no=
 go?
>>>>>> - Decouple only watermark calculation and defrag granularity from pa=
geblock order (also from Zi).
>>>>>>   The decoupling can be done separately. Watermark calculation can b=
e decoupled using the
>>>>>>   approach taken in this RFC. Although max order used by pagecache n=
eeds to be addressed.
>>>>>>
>>>>>
>>>>> I need to catch up with the thread (workload crazy atm), but why isn'=
t it
>>>>> feasible to simply statically adjust the pageblock size?
>>>>>
>>>>> The whole point of 'defragmentation' is to _heuristically_ make it le=
ss
>>>>> likely there'll be fragmentation when requesting page blocks.
>>>>>
>>>>> And the watermark code is explicitly about providing reserves at a
>>>>> _pageblock granularity_.
>>>>>
>>>>> Why would we want to 'defragment' to 512MB physically contiguous chun=
ks
>>>>> that we rarely use?
>>>>>
>>>>> Since it's all heuristic, it seems reasonable to me to cap it at a se=
nsible
>>>>> level no?
>>>>
>>>> What is a sensible level? 2MB is a good starting point. If we cap page=
block
>>>> at 2MB, everyone should be happy at the moment. But if one user wants =
to
>>>> allocate 4MB mTHP, they will most likely fail miserably, because pageb=
lock
>>>> is 2MB, kernel is OK to have a 2MB MIGRATE_MOVABLE pageblock next to a=
 2MB
>>>> MGIRATE_UNMOVABLE one, making defragmenting 4MB an impossible job.
>>>>
>>>> Defragmentation has two components: 1) pageblock, which has migratetyp=
es
>>>> to prevent mixing movable and unmovable pages, as a single unmovable p=
age
>>>> blocks large free pages from being created; 2) memory compaction granu=
larity,
>>>> which is the actual work to move pages around and form a large free pa=
ges.
>>>> Currently, kernel assumes pageblock size =3D defragmentation granulari=
ty,
>>>> but in reality, as long as pageblock size >=3D defragmentation granula=
rity,
>>>> memory compaction would still work, but not the other way around. So w=
e
>>>> need to choose pageblock size carefully to not break memory compaction=
.
>>>
>>> OK I get it - the issue is that compaction itself operations at a pageb=
lock
>>> granularity, and once you get so fragmented that compaction is critical=
 to
>>> defragmentation, you are stuck if the pageblock is not big enough.
>>
>> Right.
>>
>>>
>>> Thing is, 512MB pageblock size for compaction seems insanely inefficien=
t in
>>> itself, and if we're complaining about issues with unavailable reserved
>>> memory due to crazy PMD size, surely one will encounter the compaction
>>> process simply failing to succeed/taking forever/causing issues with
>>> reclaim/higher order folio allocation.
>>
>> Yep. Initially, we probably never thought PMD THP would be as large as
>> 512MB.
>
> Of course, such is the 'organic' nature of kernel development :)
>
>>
>>>
>>> I mean, I don't really know the compaction code _at all_ (ran out of ti=
me
>>> to cover in book ;), but is it all or-nothing? Does it grab a pageblock=
 or
>>> gives up?
>>
>> compaction works on one pageblock at a time, trying to migrate in-use pa=
ges
>> within the pageblock away to create a free page for THP allocation.
>> It assumes PMD THP size is equal to pageblock size. It will keep working
>> until a PMD THP size free page is created. This is a very high level
>> description, omitting a lot of details like how to avoid excessive compa=
ction
>> work, how to reduce compaction latency.
>
> Yeah this matches my assumptions.
>
>>
>>>
>>> Because it strikes me that a crazy pageblock size would cause really
>>> serious system issues on that basis alone if that's the case.
>>>
>>> And again this leads me back to thinking it should just be the page blo=
ck
>>> size _as a whole_ that should be adjusted.
>>>
>>> Keep in mind a user can literally reduce the page block size already vi=
a
>>> CONFIG_PAGE_BLOCK_MAX_ORDER.
>>>
>>> To me it seems that we should cap it at the highest _reasonable_ mTHP s=
ize
>>> you can get on a 64KB (i.e. maximum right? RIGHT? :P) base page size
>>> system.
>>>
>>> That way, people _can still get_ super huge PMD sized huge folios up to=
 the
>>> point of fragmentation.
>>>
>>> If we do reduce things this way we should give a config option to allow
>>> users who truly want collosal PMD sizes with associated
>>> watermarks/compaction to be able to still have it.
>>>
>>> CONFIG_PAGE_BLOCK_HARD_LIMIT_MB or something?
>>
>> I agree with capping pageblock size at a highest reasonable mTHP size.
>> In case there is some user relying on this huge PMD THP, making
>> pageblock a boot time variable might be a little better, since
>> they do not need to recompile the kernel for their need, assuming
>> distros will pick something like 2MB as the default pageblock size.
>
> Right, this seems sensible, as long as we set a _default_ that limits to
> whatever it would be, 2MB or such.
>
> I don't think it's unreasonable to make that change since this 512 MB thi=
ng
> is so entirely unexpected and unusual.
>
> I think Usama said it would be a pain it working this way if it had to be
> explicitly set as a boot time variable without defaulting like this.
>
>>
>>>
>>> I also question this de-coupling in general (I may be missing somethig
>>> however!) - the watermark code _very explicitly_ refers to providing
>>> _pageblocks_ in order to ensure _defragmentation_ right?
>>
>> Yes. Since without enough free memory (bigger than a PMD THP),
>> memory compaction will just do useless work.
>
> Yeah right, so this is a key thing and why we need to rework the current
> state of the patch.
>
>>
>>>
>>> We would need to absolutely justify why it's suddenly ok to not provide
>>> page blocks here.
>>>
>>> This is very very delicate code we have to be SO careful about.
>>>
>>> This is why I am being cautious here :)
>>
>> Understood. In theory, we can associate watermarks with THP allowed orde=
rs
>> the other way around too, meaning if user lowers vm.min_free_kbytes,
>> all THP/mTHP sizes bigger than the watermark threshold are disabled
>> automatically. This could fix the memory compaction issues, but
>> that might also drive user crazy as they cannot use the THP sizes
>> they want.
>
> Yeah that's interesting but I think that's just far too subtle and people=
 will
> have no idea what's going on.
>
> I really think a hard cap, expressed in KB/MB, on pageblock size is the w=
ay to
> go (but overrideable for people crazy enough to truly want 512 MB pages -=
 and
> who cannot then complain about watermarks).

I agree. Basically, I am thinking:
1) use something like 2MB as default pageblock size for all arch (the value=
 can
be set differently if some arch wants a different pageblock size due to oth=
er reasons), this can be done by modifying PAGE_BLOCK_MAX_ORDER=E2=80=99s d=
efault
value;

2) make pageblock_order a boot time parameter, so that user who wants
512MB pages can still get it by changing pageblock order at boot time.

WDYT?

>
>>
>> Often, user just ask for an impossible combination: they
>> want to use all free memory, because they paid for it, and they
>> want THPs, because they want max performance. When PMD THP is
>> small like 2MB, the =E2=80=9Cunusable=E2=80=9D free memory is not that n=
oticeable,
>> but when PMD THP is as large as 512MB, user just cannot unsee it. :)
>
> Well, users asking for crazy things then being surprised when they get th=
em
> is nothing new :P
>
>>
>>
>> Best Regards,
>> Yan, Zi
>
> Thanks for your input!
>
> Cheers, Lorenzo


Best Regards,
Yan, Zi
