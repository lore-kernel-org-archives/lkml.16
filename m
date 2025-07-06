Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BE61BF37
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751771036; cv=fail; b=GSxfuCxZZFc1dPflTZEHeS2empE8VyeIGzEQ7ax6/XpDF7Ky9/OxIIlvSkPAwR+80vD5whKoRn7mct2UpOxo7cSlxavBfwYAKCWN1l/JFxX0Eeu/ZJVI+kWjRPAafJL3SnvjTM4WyKTMBprQ1wsdFd4txTI/s2ytpEaWX+el0aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751771036; c=relaxed/simple;
	bh=ZF/jrh8rfGGbcIL5rdlcK93iBxqct/hvt2eJqUNlGD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e1tL8WIRxi2CuLH3IkjSrCupjLDI9bLwyZxXx3QRVyi/qO0KTRIJwNN2BQzfdFCE1Nc6i8bx6UBdXIKtAQ2iRGyZx2AMwasgAlrokc5p1SgtIr8wb8yaBd+6Z1FslNpNNd608NOeONWdKCbrtIvJyKBTKHUTMC1LoQbXZXh9CTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JU6UsTAp; arc=fail smtp.client-ip=40.107.92.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JU6UsTAp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgtw1Q7qCPZ+Qy/iYigSJnn1myCWP48YE00UAEC9f9ZZAOW/QFZ+lt2DCVAtzPKDOihUE5tGu4jxQ+3cZAX3YmP84vWOVS8ZX1Hr1kyjp5duFW2xis/bEmH1TH9hEa3eXsX5mSUlUnc1wpji1lDqxsLMxM0qp1eK5dtsjn1PsRe1b7YRubzHNMjucR/2M0z+phOzHQkJ6vE01WDto+5BkO+/exIuDiXGGfiBsqPfzsfSpTzdTHM01dnVnMq2WAxjb/Fj0fxi1UmM+kOjsvB+lvUZ2OtLp16ZidFtPyOAJkCpnTrBdr+cVSznLn9IK9YEyOPeDDp4ww8/ZdmRsP0p4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gj4U4Uu2jeb7quOCH+XP/5hh3GHusZBi7+3jHCdFRMk=;
 b=uGN2pYjVRiB8ZiTnXsFt4Ckl1aukRPutO+Pz4zRDMXJt2YZNkfTgy/GGRLRjCaWplvYzmg/Da+yYWZ33dxt6ual2VqSv9San4JrVqXD4fQRjbRsnXqlecvvrm/kUPSLqpt7p0AvI4JyifHSE1s1biI3fyvPq/zCrL+UrwvHgKzxmpY1GtKlqxCY/ijHFbJvclRVvvpR14ed/4bFnzdCOoTywWtH4hSBvMqRGJ4UuD+jG7mPIXQ5JuxsxE9NWgUdnXuG8AurIbohCUWL/bGUrJM5Wf24E3r0EYnrATxpuMZexggvpmOLLwcBQyFI6yMWU9Yk9ieILAbk15um49zANHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gj4U4Uu2jeb7quOCH+XP/5hh3GHusZBi7+3jHCdFRMk=;
 b=JU6UsTAp6ykepZvmyASczCIVvdN3uRL+XhvBfTEs7RH+wXR+GbbeSruO19z/TqK+qjQAMvTjJdB10tbkijzhfXKYKd+CVdy0gOpVlZ6xtEA7vq+M2rEy7XKlIyTDpBa5jYvyFztDdyPZCuu3jFm3sJO5OFBDEBRxfVf0gf9xPmglEsekrCr4hZFWiAtBg0yJFN3pslSzcJMUGglpUWEnvf6uRy4o43iVJleFdD0RkTABYgPjwITnncYUFi7F4ZhDqW3+OsPiRfcEGUQLKAtIAWdIoO6sOl0FZTDYEzadXmqvVk7tNyxzSRDvmwFINF71LGYmvBOCVI5cOIq3MBhmsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB6111.namprd12.prod.outlook.com (2603:10b6:8:ac::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.23; Sun, 6 Jul 2025 03:03:51 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 03:03:51 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: <linux-mm@kvack.org>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
Subject: Re: [v1 resend 08/12] mm/thp: add split during migration support
Date: Sat, 05 Jul 2025 23:03:48 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <94D8C1A4-780C-4BEC-A336-7D3613B54845@nvidia.com>
In-Reply-To: <2BC37A17-1005-4016-B4D8-85832F75C500@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-9-balbirs@nvidia.com>
 <D129A3F2-D79C-482E-BC70-A26C781B149E@nvidia.com>
 <1a451d37-56c3-4d60-8e06-3abae72e6bbd@nvidia.com>
 <007E2728-5BFC-40F9-8B8F-25504863D217@nvidia.com>
 <aa4f94a3-f601-4379-b6ca-4389421ccca4@nvidia.com>
 <906590D4-04E2-40CB-A853-25FE6212700C@nvidia.com>
 <eab52820-813f-4137-b664-c79ba8b453b7@nvidia.com>
 <2BC37A17-1005-4016-B4D8-85832F75C500@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0283.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dda5563-5888-4d9d-daab-08ddbc39bc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ICjHtjfWRzFSU3H4Fxhd36ngyFB1PnCoDJKfKJj9zJmVQrpP+Uoz18UPheeL?=
 =?us-ascii?Q?TbqIkNi9V1GOkWfiuPVERx+0QuBBvxze1ahkpSJDY16aK4kQCSdq8717tPIq?=
 =?us-ascii?Q?VTExh8fozGe8kK2UwVUk9dMCG9SnCEwDwVs5Kp+/F32wYyCpVh/hX+WecZsJ?=
 =?us-ascii?Q?Exjn/rWjRQR7cBJyRaxNqMCBC2j5H0+frUUGSUvRdEsN5I9T//LbviNNqyld?=
 =?us-ascii?Q?ewCER57O9VG0hdlJFsFMHXt3imJsTlw50yiAqX2wm+wRdUO0HoiPQ94/VHuV?=
 =?us-ascii?Q?gV+wKUQ9KlSgdKbBnF1G0712C66o+8BDxsUhOZ7dhfFBuGnl/7mx5FeWq7JU?=
 =?us-ascii?Q?HZDKCiPpf2w6tvczgvBcWU6MeaeSKckjd3GGq3QQs5FOIi7gwDk55gcFSn35?=
 =?us-ascii?Q?VsvfJnh0nXsOfjzT6Vi9YYe/VlE/UhJj/IEa449jx14UPdYAHzRIyPW7qKzG?=
 =?us-ascii?Q?DTs5rY00ZlUWsgy3xaaGhlp7o5qkHZc5kbgaZxprO8/f1ssSkOBJHZagdhVt?=
 =?us-ascii?Q?xp5C5cKqozgXiGS1pLr/TyJP6vWB1w7xbZpKzBEektFNek4dMRj8+50JS2/4?=
 =?us-ascii?Q?jEqhdcrrUUlyz04OzLoi4yvmZjRUGBpCQYmIeSbXAwRv6gT2yfJuon7LJZuM?=
 =?us-ascii?Q?l7jSBnc7NEAu1oUbWbYptVgNO42tm4CQBRNIsnkQV2vFsEm6kxztBY5xCT67?=
 =?us-ascii?Q?WayezCNpWpDQVCPKQyE7UdSmbRVYgOMqf/Y2fgRntrWVZ+350+yS83FkuQVo?=
 =?us-ascii?Q?mtEcskh9O14XCltA+wIURrheag+W9X+mgzvqU3wEJsPMz36nS10s/mfWGHIh?=
 =?us-ascii?Q?7zDTmLi+WFY6La4Pm2HT0tyspQVpPG0Ui3i6LtJySZs0hGIXnxpKXdlDclPM?=
 =?us-ascii?Q?ubc/WTe6/nFCN0Y+1jwuNn0/G3eiRvhJJrrdZa9nCLGHd+GPngxr+toB8sry?=
 =?us-ascii?Q?nLE1ZJlG+Gr2iAmGEhCSXEDmFARrIbb7IEFFs0ItLJoUrZ89JsYFNbibR1IX?=
 =?us-ascii?Q?Nn6AZ/jg65jWpA6x74m6pozC3ltYPH6lgUHCk+yv5UiR6X22B/zZRVG8oxal?=
 =?us-ascii?Q?vs1wdsc/HKRWPG2YQtVylWKwyn4HsAOYasFtJEQSXwEPsc2sWByTV5CEqMrR?=
 =?us-ascii?Q?dTLris+UnDDaKu/ao/LIr2flFf7kDhuaxpP+Ao8cVGsVdYSDtISGPBx0Gvbo?=
 =?us-ascii?Q?1K92494OOLoHgPGfvTenfKb13iMclO2M8k+O1QU4ViiiqUYwIlyTLP9NUA02?=
 =?us-ascii?Q?7OwT3Mi4bo+rV8AByTaaj+OLRBUqqDFS5Qaf+ped77FXvZ2bDXuZ+OfAfWfC?=
 =?us-ascii?Q?hNm6ypHH18QR1ztY9Hftw43EILevUymEPDOXAX1ASSzjcQvjMP9m3LzazayZ?=
 =?us-ascii?Q?Xgj4jQ1OUiu7hw+TPtbL6BTqOYqpsOcJ+FnlpM6VjmVy54h9wUteizOyOp8K?=
 =?us-ascii?Q?2VX/6xNU9F4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2UVAvGjAq3xIZLeZY88SIv72A17u+VQ9VBIs18De6LA6T2h+clccdT4ty99+?=
 =?us-ascii?Q?COOYt3iFwREKpn/vnrqK+HYLiqEB7N3daWLLAjwuA/WlQk9xZeAaY0sUb4aB?=
 =?us-ascii?Q?H+47+qpHnDxl7jnhnGpYN9OcMYZSvtCw83ZF3HNywG+hx6RiSF13kmnVggE3?=
 =?us-ascii?Q?+Tytsw5cMjKA3QNk3LYMQcCApcn2n3Z5digxFdTBpqlazy2ZAKR/q+DWL3g5?=
 =?us-ascii?Q?J58CuvQKK4nwUR+9HCX+mQI91BKBdGZ5uOA01O9HRIxOXl9WxEDXdfjMMb9h?=
 =?us-ascii?Q?vRzLCJOtMduviR6XhOqYmBvHlCYHG4PdQ1o3DI/wiscix9nRQpZnezGitr8A?=
 =?us-ascii?Q?WyBQL7Gm45GJBRy/5i5vekKUCKg0ocV1RfLUHIAs8ga6ddp5oG6o+6723Lq8?=
 =?us-ascii?Q?SryEjZeEifSj68DIIKirA0hZGDzgjYRLyL+NbOh1HLki/Fu8jGoUVlEQ7GQ2?=
 =?us-ascii?Q?cJpFFvBsml7xB0c1nHBoX4DK+oWrc2X2b8ylGGYgPe3KhZAf7TgFMFA8cX9d?=
 =?us-ascii?Q?qyMuLYDPeNvrR8Zvf79ZGxnM4uAvILzp7RqdNOxr6E/8/erOKnh8cNxRbLSh?=
 =?us-ascii?Q?JWSOemj4wWf/SJtr+WE8tJfRqwMI1/qGJS1c1yF0y9JgHPwORPMgrIuBdK9v?=
 =?us-ascii?Q?2uqVNGIeMcBxaMXP2C+DQKdRZj+URay9u2hKqqxFH6GxQDNfrtiqqBXCWKwp?=
 =?us-ascii?Q?1jatcnsFmufRSmMLcwX2r/6tZjNOmgzaKHh11nZJaXU8rKQd1zGyAE+Tfzt1?=
 =?us-ascii?Q?RNb0gt0Jt4AiIa/YCTpdyqIP2wzzkHQGg+i6QBp+sSDZXm7j3/aSoKGv3a7W?=
 =?us-ascii?Q?nJMrYZiv7Aj78aQEMXyWqOLr9CsuLsos32y+7dQe7t8eLuXX4rG/kjyn0bd+?=
 =?us-ascii?Q?QySUt61vWlQ+wHmfa0wbY5Fuy3+IpKP+MEX9wJtRUbIbr1dVDj3SdTiTx6e3?=
 =?us-ascii?Q?38ZrxuNN1zP2hI0h5xRWB0de4SsRPsRUHlDmtqyVtv38AoeyQ5tldNTFRfqs?=
 =?us-ascii?Q?VyTNYtzBXFhUCCAIQEhXdVJOmiFJb4iEyGGfnl/U13cCaED3pFUiN5iCCtOz?=
 =?us-ascii?Q?+AmjUtarpR2mhbm0v33oQkxOxpJTMG86YBqZCakHto6eg9ASIIB78ncgeL8G?=
 =?us-ascii?Q?iNVBYUi20W+5ineLFkSFwZuhC2fuGaefh3+sC3AI8+b8SyDPgH3ZdORYSHYU?=
 =?us-ascii?Q?ZkFYxqIzNFKlM+LFYENHX5vZU1v1WEnT8xXwL9ih5JkSHsyCNUe55DgNX9z6?=
 =?us-ascii?Q?ed1qX6kqfxpnwVU7XjnGA2T+n8nYzxroNVH2rbGZuCRXGaK1p+TLQIRCR1oN?=
 =?us-ascii?Q?TBZQFX7FO8nhGaPSSDAdBuwd2s+x4NYJVQu9em2bN/PsyJxE7DSAMmCXG/Rs?=
 =?us-ascii?Q?BLspCgvCO0Opbw9J6JC4z/rBHO27ZyO93fS2QpRTe3Ygb0ZCOwrOdcpNFsZL?=
 =?us-ascii?Q?7sYr3uHKxUIsImjezE9c1pvCbMjTxcOm3bMSwbarPz5bTSe6BgdKPi1ZLOcW?=
 =?us-ascii?Q?7xzElE4ERF9nliiXmik35yY+syQMiB399WqF5W097A6tZI0LA/FkIMX2cu8F?=
 =?us-ascii?Q?Pt6vaBnI+ZQ/e5Td9DA7eUZMfECDEakC7j5xP99t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dda5563-5888-4d9d-daab-08ddbc39bc1d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 03:03:51.2961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EU/yXbtO4BHulweRmUkuIpa9d2mSHuDoJCxVMvEjBmmpQvv+ZY8f91pXrSCjmSKW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6111

On 5 Jul 2025, at 22:34, Zi Yan wrote:

> On 5 Jul 2025, at 21:47, Balbir Singh wrote:
>
>> On 7/6/25 11:34, Zi Yan wrote:
>>> On 5 Jul 2025, at 21:15, Balbir Singh wrote:
>>>
>>>> On 7/5/25 11:55, Zi Yan wrote:
>>>>> On 4 Jul 2025, at 20:58, Balbir Singh wrote:
>>>>>
>>>>>> On 7/4/25 21:24, Zi Yan wrote:
>>>>>>>
>>>>>>> s/pages/folio
>>>>>>>
>>>>>>
>>>>>> Thanks, will make the changes
>>>>>>
>>>>>>> Why name it isolated if the folio is unmapped? Isolated folios of=
ten mean
>>>>>>> they are removed from LRU lists. isolated here causes confusion.
>>>>>>>
>>>>>>
>>>>>> Ack, will change the name
>>>>>>
>>>>>>
>>>>>>>>   *
>>>>>>>>   * It calls __split_unmapped_folio() to perform uniform and non=
-uniform split.
>>>>>>>>   * It is in charge of checking whether the split is supported o=
r not and
>>>>>>>> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio =
*folio, unsigned int new_order,
>>>>>>>>   */
>>>>>>>>  static int __folio_split(struct folio *folio, unsigned int new_=
order,
>>>>>>>>  		struct page *split_at, struct page *lock_at,
>>>>>>>> -		struct list_head *list, bool uniform_split)
>>>>>>>> +		struct list_head *list, bool uniform_split, bool isolated)
>>>>>>>>  {
>>>>>>>>  	struct deferred_split *ds_queue =3D get_deferred_split_queue(f=
olio);
>>>>>>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>>>>>> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *f=
olio, unsigned int new_order,
>>>>>>>>  		 * is taken to serialise against parallel split or collapse
>>>>>>>>  		 * operations.
>>>>>>>>  		 */
>>>>>>>> -		anon_vma =3D folio_get_anon_vma(folio);
>>>>>>>> -		if (!anon_vma) {
>>>>>>>> -			ret =3D -EBUSY;
>>>>>>>> -			goto out;
>>>>>>>> +		if (!isolated) {
>>>>>>>> +			anon_vma =3D folio_get_anon_vma(folio);
>>>>>>>> +			if (!anon_vma) {
>>>>>>>> +				ret =3D -EBUSY;
>>>>>>>> +				goto out;
>>>>>>>> +			}
>>>>>>>> +			anon_vma_lock_write(anon_vma);
>>>>>>>>  		}
>>>>>>>>  		end =3D -1;
>>>>>>>>  		mapping =3D NULL;
>>>>>>>> -		anon_vma_lock_write(anon_vma);
>>>>>>>>  	} else {
>>>>>>>>  		unsigned int min_order;
>>>>>>>>  		gfp_t gfp;
>>>>>>>> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *fol=
io, unsigned int new_order,
>>>>>>>>  		goto out_unlock;
>>>>>>>>  	}
>>>>>>>>
>>>>>>>> -	unmap_folio(folio);
>>>>>>>> +	if (!isolated)
>>>>>>>> +		unmap_folio(folio);
>>>>>>>>
>>>>>>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>>>>>>  	local_irq_disable();
>>>>>>>> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *f=
olio, unsigned int new_order,
>>>>>>>>
>>>>>>>>  		ret =3D __split_unmapped_folio(folio, new_order,
>>>>>>>>  				split_at, lock_at, list, end, &xas, mapping,
>>>>>>>> -				uniform_split);
>>>>>>>> +				uniform_split, isolated);
>>>>>>>>  	} else {
>>>>>>>>  		spin_unlock(&ds_queue->split_queue_lock);
>>>>>>>>  fail:
>>>>>>>>  		if (mapping)
>>>>>>>>  			xas_unlock(&xas);
>>>>>>>>  		local_irq_enable();
>>>>>>>> -		remap_page(folio, folio_nr_pages(folio), 0);
>>>>>>>> +		if (!isolated)
>>>>>>>> +			remap_page(folio, folio_nr_pages(folio), 0);
>>>>>>>>  		ret =3D -EAGAIN;
>>>>>>>>  	}
>>>>>>>
>>>>>>> These "isolated" special handlings does not look good, I wonder i=
f there
>>>>>>> is a way of letting split code handle device private folios more =
gracefully.
>>>>>>> It also causes confusions, since why does "isolated/unmapped" fol=
ios
>>>>>>> not need to unmap_page(), remap_page(), or unlock?
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> There are two reasons for going down the current code path
>>>>>
>>>>> After thinking more, I think adding isolated/unmapped is not the ri=
ght
>>>>> way, since unmapped folio is a very generic concept. If you add it,=

>>>>> one can easily misuse the folio split code by first unmapping a fol=
io
>>>>> and trying to split it with unmapped =3D true. I do not think that =
is
>>>>> supported and your patch does not prevent that from happening in th=
e future.
>>>>>
>>>>
>>>> I don't understand the misuse case you mention, I assume you mean so=
meone can
>>>> get the usage wrong? The responsibility is on the caller to do the r=
ight thing
>>>> if calling the API with unmapped
>>>
>>> Before your patch, there is no use case of splitting unmapped folios.=

>>> Your patch only adds support for device private page split, not any u=
nmapped
>>> folio split. So using a generic isolated/unmapped parameter is not OK=
=2E
>>>
>>
>> There is a use for splitting unmapped folios (see below)
>>
>>>>
>>>>> You should teach different parts of folio split code path to handle=

>>>>> device private folios properly. Details are below.
>>>>>
>>>>>>
>>>>>> 1. if the isolated check is not present, folio_get_anon_vma will f=
ail and cause
>>>>>>    the split routine to return with -EBUSY
>>>>>
>>>>> You do something below instead.
>>>>>
>>>>> if (!anon_vma && !folio_is_device_private(folio)) {
>>>>> 	ret =3D -EBUSY;
>>>>> 	goto out;
>>>>> } else if (anon_vma) {
>>>>> 	anon_vma_lock_write(anon_vma);
>>>>> }
>>>>>
>>>>
>>>> folio_get_anon() cannot be called for unmapped folios. In our case t=
he page has
>>>> already been unmapped. Is there a reason why you mix anon_vma_lock_w=
rite with
>>>> the check for device private folios?
>>>
>>> Oh, I did not notice that anon_vma =3D folio_get_anon_vma(folio) is a=
lso
>>> in if (!isolated) branch. In that case, just do
>>>
>>> if (folio_is_device_private(folio) {
>>> ...
>>> } else if (is_anon) {
>>> ...
>>> } else {
>>> ...
>>> }
>>>
>>>>
>>>>> People can know device private folio split needs a special handling=
=2E
>>>>>
>>>>> BTW, why a device private folio can also be anonymous? Does it mean=

>>>>> if a page cache folio is migrated to device private, kernel also
>>>>> sees it as both device private and file-backed?
>>>>>
>>>>
>>>> FYI: device private folios only work with anonymous private pages, h=
ence
>>>> the name device private.
>>>
>>> OK.
>>>
>>>>
>>>>>
>>>>>> 2. Going through unmap_page(), remap_page() causes a full page tab=
le walk, which
>>>>>>    the migrate_device API has already just done as a part of the m=
igration. The
>>>>>>    entries under consideration are already migration entries in th=
is case.
>>>>>>    This is wasteful and in some case unexpected.
>>>>>
>>>>> unmap_folio() already adds TTU_SPLIT_HUGE_PMD to try to split
>>>>> PMD mapping, which you did in migrate_vma_split_pages(). You probab=
ly
>>>>> can teach either try_to_migrate() or try_to_unmap() to just split
>>>>> device private PMD mapping. Or if that is not preferred,
>>>>> you can simply call split_huge_pmd_address() when unmap_folio()
>>>>> sees a device private folio.
>>>>>
>>>>> For remap_page(), you can simply return for device private folios
>>>>> like it is currently doing for non anonymous folios.
>>>>>
>>>>
>>>> Doing a full rmap walk does not make sense with unmap_folio() and
>>>> remap_folio(), because
>>>>
>>>> 1. We need to do a page table walk/rmap walk again
>>>> 2. We'll need special handling of migration <-> migration entries
>>>>    in the rmap handling (set/remove migration ptes)
>>>> 3. In this context, the code is already in the middle of migration,
>>>>    so trying to do that again does not make sense.
>>>
>>> Why doing split in the middle of migration? Existing split code
>>> assumes to-be-split folios are mapped.
>>>
>>> What prevents doing split before migration?
>>>
>>
>> The code does do a split prior to migration if THP selection fails
>>
>> Please see https://lore.kernel.org/lkml/20250703233511.2028395-5-balbi=
rs@nvidia.com/
>> and the fallback part which calls split_folio()
>
> So this split is done when the folio in system memory is mapped.
>
>>
>> But the case under consideration is special since the device needs to =
allocate
>> corresponding pfn's as well. The changelog mentions it:
>>
>> "The common case that arises is that after setup, during migrate
>> the destination might not be able to allocate MIGRATE_PFN_COMPOUND
>> pages."
>>
>> I can expand on it, because migrate_vma() is a multi-phase operation
>>
>> 1. migrate_vma_setup()
>> 2. migrate_vma_pages()
>> 3. migrate_vma_finalize()
>>
>> It can so happen that when we get the destination pfn's allocated the =
destination
>> might not be able to allocate a large page, so we do the split in migr=
ate_vma_pages().
>>
>> The pages have been unmapped and collected in migrate_vma_setup()
>
> So these unmapped folios are system memory folios? I thought they are
> large device private folios.
>
> OK. It sounds like splitting unmapped folios is really needed. I think
> it is better to make a new split_unmapped_folio() function
> by reusing __split_unmapped_folio(), since __folio_split() assumes
> the input folio is mapped.

And to make __split_unmapped_folio()'s functionality match its name,
I will later refactor it. At least move local_irq_enable(), remap_page(),=

and folio_unlocks out of it. I will think about how to deal with
lru_add_split_folio(). The goal is to remove the to-be-added "unmapped"
parameter from __split_unmapped_folio().

--
Best Regards,
Yan, Zi
