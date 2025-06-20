Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A79C8FE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750385608; cv=fail; b=oENRdFTwl2bVLAWbXhRA7xRpCA+uFrLwnlkloHE7Vl0nJjF31bb7iL9Ky1w5IBr/JboaQOhg5nWiIS056f+2PFCWjQssqjOy/dG607xcxRCIY56uQkRr3gDyc3Sj57rcu/7pfSjFQMbvXJN9REMMWly/RiZ9yds9ZCnkB10ySic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750385608; c=relaxed/simple;
	bh=FBgfKN0QqExvUsFiKjjayfWPBPQLHYf322/ZqAQtg+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cw8y5PjA99jAEpzLAwrcPKI6IVj5qoBv/o8rWiy09wWaYAhLDRlmPaJ2vut9g8FNzn5pr3jYJejc2UrAevreq9XrlWXuYbss0p7R/zUWP8JK31hB2+668vWx3byLLi6RM6Aac4Z1O776ygcr8PC7PGWOoGdCndzyb1NRGQFSyhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KgoIxtQX; arc=fail smtp.client-ip=40.107.243.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KgoIxtQX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3/20OUnCYkESyu9dl86sbJmp1UhdAaPM+QTlh0Hx6UUctGyPwiApt/JN4sbPrDqqJAkCZvgLnylgd4sPDEprCu8zDFBOnj1ZEx+pN3qi2eEs0uEsnCKUqsdjJwK0X+232RZP4b0Z0KTy2QrpUbCpe3y+yLQRBkXIehy45fEelVBWAUa5OWvsGI1oactDIwm32/lTmrCXNmibpb3dmSR6AfjomuHPjmG6/lkiFNQOpN0KbdP/t9e0U6BlzpNw5tzpQWnZ71XhRVK8LeECgnTenw4qxdJop6KwtlOHMWiqltkVTSW6YY9qUciktLWcGW7zt6KdY7i9cZyROGsgpKhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KEGC4RxJQmxRHXs2gtMUQzzqVeYIbJy5msq/HynXuk=;
 b=oQ6gptWRl5T+9dZYcnKYR71HtHfbjBbWztBRcqG3lBHuYvQwkCvLMNXPH5+W8CredUwQ1/MPvNPKd1vleI7Xso0kqsT9kSmmDrrv5jaCuTumv7OZKu7licHAdXhWN0V1y/aEZpYFRTlud58tjxm8GJdksmvJElEex+M0rdEsd7uykdFG7/f9tfJhUmVpnAj6xRV8wbj0Sgst+i7AVye7z9VAM1zna9kwElvPBkO5gZFGGLB1ThysaxskypzoHyVbtogIzVJX4Nr8tQub+hw+/4NSdTD9UkeUVBHYC0/kVgj4/XK7U6c13CMxeW19AkcVd5WQ48SbRfTSVSJlz9Y1sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KEGC4RxJQmxRHXs2gtMUQzzqVeYIbJy5msq/HynXuk=;
 b=KgoIxtQX6V9zmtTakItS9kbLl7sdRDIMVcFJFnzDAB8vwv7CBVkbLwBchSo3rhkj1DypftKwK8wvtYp0Y+ud9VoiL5tRcwP7h58SCQXjT0pI03SIC0LuR6o7LiOcMxgzjCcXXtB5ZALCkqJDcspS7A465Ac9Pl2+0OhDoM0t4aYYBaMudrloYUuRWGfLGoMpUC8cNyf40yjMXJVA9asIH7pZJJxxgsLvQ7nb+GMeCpobncmuhrFNX1zrVKvQAWhCjE/MJe0g107sowG5tu/77vy1oOG2Xc9zeXl8rXJB1Ekeh1pzB1/ZqiAoVJ08/58s+K5I1A6sTLSfSQKbA5DAPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB7140.namprd12.prod.outlook.com (2603:10b6:510:200::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Fri, 20 Jun
 2025 02:13:23 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 02:13:22 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
 SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH 3/5] mm/madvise: thread VMA range state through
 madvise_behavior
Date: Thu, 19 Jun 2025 22:13:19 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <A88CC419-113E-41DA-83F0-016BFE50B660@nvidia.com>
In-Reply-To: <3651A1A2-6EB0-4731-BDB2-E11FF7E63749@nvidia.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <a520417243ce7f8122de05a0420f964a922e392a.1750363557.git.lorenzo.stoakes@oracle.com>
 <3651A1A2-6EB0-4731-BDB2-E11FF7E63749@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0928.namprd03.prod.outlook.com
 (2603:10b6:408:107::33) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af1657e-566a-4ea0-9dc6-08ddafa0080b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sd+gkKfe/Vq3xtDAKzG2NVvcEkQ/6T9+2V/iGxNO6XFDXrcdYlhO1SvTKJ/s?=
 =?us-ascii?Q?jTv2/hVUYJS39qUElpFNOpd3QAf4cCUUI0DyJaKSCTfqehVRhZREChjGbZF9?=
 =?us-ascii?Q?/Vq8wbGg/e7FsyAglMM6eqPN5FsPQYxEfptBjmsYdKpyHpo8qqKDkkWVF3ad?=
 =?us-ascii?Q?bNtZu9oOuwRjxTlNcZ3m48WDJC8gxLyQ7HuayhJRoIexDZzOfUHqcfdReupG?=
 =?us-ascii?Q?3jcmkFq9XKYCYTcGUmLRUg48n/oZy6woFcxIuhey5L+hUX2e1LykV8ZRzGeW?=
 =?us-ascii?Q?ZLBnOVKblawAJrO9EfpaFmFtOC3jAGOdwDvlsdbHJpjchvfe2i00TyACuA3d?=
 =?us-ascii?Q?S/9WUEJlcw2Cj6ZMfyo9iCLSyD8XbwZofTrhh0xjQS4+pV/lkiqnpxqSXtRI?=
 =?us-ascii?Q?pZUxt/o1aRt9lDrJmM5AOcRoq+XgSxoAwB6t62D00+BdpHPi1frsKDYUR++o?=
 =?us-ascii?Q?FtKt8Oz95GtPsK7sQ4mj6oYSp7Q9jM0iIOyOuyRI4keTZajeMDwlcIhOLLA0?=
 =?us-ascii?Q?rANhA7u9jPSAlI1fG8XD5A8pKSaT248t537Gx+zDiIW5Hdo3y7ZXKjNKekQJ?=
 =?us-ascii?Q?Kq+4xKX9CHPZCdR6WPp2KxviSFFtPckcQuNnroLU5RW0HicQYs02T1shS5Xs?=
 =?us-ascii?Q?R9XG+SzlyiFYH/7s45MTHXhwCfWr8CwyZh/98UgsG2Vg69AwdjixhceRIsAd?=
 =?us-ascii?Q?N3jOeYJvQBCss8mxFPzq7CIhBJhECiYJuSfK02DRuOtxaj2tBMh9e3M0g7NM?=
 =?us-ascii?Q?ATpONYs/kzWL69MlIiouklPS4p164oSacfflMb5sySxryO0aM4UfCgjbpMUc?=
 =?us-ascii?Q?+1QPL4dc2XWCoI40t07hEMCuUSPFHo0M+Hq1B65ep0UyKbsGeZ9jnpEeJkiC?=
 =?us-ascii?Q?pwUeyPOj3OVdXvMSKI6ivmWWUk8cQTgtYb2Mws4ajd2qkyt2tBpcBpFstPXk?=
 =?us-ascii?Q?GTGmArQ8fVaJE/FBbOqLomyzaKfxOE3m2B0G636xwWzSO/x4qrcTLC8sLMyZ?=
 =?us-ascii?Q?FvbBtMHJoo07NN6syNqNCzJ7EzkraTa/+27aC93EfE+86ZR7zmhtznBFAYMr?=
 =?us-ascii?Q?PhJoyJD1Nm4juH8JldRNT6RK6/67icq7mTD8f1CBIta5cZJsow9jTWU9rdsc?=
 =?us-ascii?Q?4741hi9eAtRo09HuXlIziic8j6KLzzNlUF7JszB8t5ISp6GOqMl9xTh060jk?=
 =?us-ascii?Q?Qrfn1gBcsfMX/6yoAtNxf+1zWKHQPKzHaBtcPm6uwFNPifhWdkkLR7yYNUm+?=
 =?us-ascii?Q?VP7dZjKgdQy78VOln4ZsA185ka+gmHr9LZhtZruHx12J4nFYulorbxumG+W3?=
 =?us-ascii?Q?7KnY6bRrLRtOAYttVBHmJ2QKlf/CCaOB6jBxWggsIDiEnDyvyQveiJlaXPZI?=
 =?us-ascii?Q?vKut+TaSYXUxq+1iuO9Y7J4TOCAGpiYeqtF2FE+q7RqVymWPRPRoz2w6HYbA?=
 =?us-ascii?Q?w12XyYxUMgQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WqayrBTcvdKY9lMW8DsLZMfZclMl2KjSAwPPJzqs5Sg4SH74M6Dw9oM5+REZ?=
 =?us-ascii?Q?Hntsu7WgJV6OteBFhjQ4oy4LTGTKKD3MINUhjFlZ+GzlTdcD7TXRXrH+ci+g?=
 =?us-ascii?Q?vMNOpzLuXZQW9yrcKaDyi7W6TVXYDjH/Ymo8DQr84TzKR1pnHQrgcl1wKMEh?=
 =?us-ascii?Q?KQ0BD5IhLUjzHRPXrgGGj+ZG86JH6PnNHbyus/8i79NpMLo6iCBjkByrgS4E?=
 =?us-ascii?Q?B5JYXc9JmPStjtGccw3EqyI/Op4ckY5Htdoyf7nG+DioNzVfwFsrgL7nWT0d?=
 =?us-ascii?Q?roLeS1W17wemhHNSywhPANJ1OLmpVHSSkm9Zqd3kuQ4uMKXAlcXpQNtDsI1G?=
 =?us-ascii?Q?lik1w8Kt9YusZn05YsS0MMpnrT9czqnlNggzz34f3gSr8gpj6RrU5xy+/bt3?=
 =?us-ascii?Q?5uOX9y4WYcPWMeLW1ZGnHGd41Rf/+1UnWHoW5CbRoAzzc4zinDY77tNB20Fa?=
 =?us-ascii?Q?NDwJ8+Ijq3tldZeFH6mMPRDbh8HIddhQ2pGRsLDJmMcxs4/mLYzds6wFYZUo?=
 =?us-ascii?Q?OXiIdxH3b8v9z4aOxvCzxxhP2b48j1m8Fu/Vruy5V2tShxmBVEMpko3O9LG0?=
 =?us-ascii?Q?0SeTl5yjFl1MlmYfL0lHCyufhKPjprO3oz/nBpIn/dhDNaHvYBZ7bzARZeCb?=
 =?us-ascii?Q?WuRkoPY0iPWraOh2lYJrq7zee7GfLw/t67On2ZFxaIQsJmQeDSxIEu7z9nyi?=
 =?us-ascii?Q?d0NFxqb3Q1Sx/LOAq4jKKgSIZISosfrqWZbBfw0NYxbIsiliEVVktwgmDK2b?=
 =?us-ascii?Q?qCcUYjPBDlaWJV4ML9f8wW3D+urmBzQD1pKwtw9LQStxC3lVnCFIuk2bpgI5?=
 =?us-ascii?Q?QLNOl3FfDLB2eZ6pTkhRfVUnV+q/Rhlf+kmhopYklGGyt6cQXxp/Bo62nCc2?=
 =?us-ascii?Q?TgnQ5vmJHAzWSNNfyYdSoyl1kM6RI45JxvPDXLP76vrsqV7Ooo1uiTErJPOK?=
 =?us-ascii?Q?3pCoI4bgbdvwK9sraHO2Lqp4sxhatUGAN5yl0151w7KgO4Irgd1Tmj3hlUIm?=
 =?us-ascii?Q?qtWvsjcz9201lQy3vroQsdr5E2ZwW2tBTZPRpChrQD4ItuC3gi0a8p9I6RgT?=
 =?us-ascii?Q?iTh+DXa7JwqvksJDg8ITVLPPvkcWJ3m6y9kKgViNhBopWMeXKHhJP0H8H0iy?=
 =?us-ascii?Q?wEzl7h6wobSR/6Ib8xs8OSACZwKHuOtrFpUkIC/T50gvHfIUE+Ti0Fz0kZ97?=
 =?us-ascii?Q?Jy9mQRVZPnh2rKehQPZ3M9Zgz0MR9WqmlPsy4i2W2quTpYKb9uAqSP8Kp21B?=
 =?us-ascii?Q?T6eG20icojmceQkoqFa1L+j0c/5erBz9TCZLlvx2okkctxiMP5CAuV81k3X4?=
 =?us-ascii?Q?+dxEEFFxtiFQkE2QaWzjvedMVUYYF8J25MGddapIpVxkXKFHoFJWnY6DBHmm?=
 =?us-ascii?Q?4Ijt/d7dG98LBnP8IQzJR6NcSZGOf8ORNDIN1hfQ4yAheL1Bz17rLpudpLoj?=
 =?us-ascii?Q?y5r1pU3iBaW/xBjCBFCOMRVgmaN88NBc+tI830bp7L5Pi9fLMdlOMHYdpog3?=
 =?us-ascii?Q?XSdJbh7R0l47W0YP7aN2Xo3dOeDueAiB8nGOCT61ajxx4he8cjxwmRRYbSyJ?=
 =?us-ascii?Q?Ju/QX5HhUL7LXJJ/w6A2t0byQsf9Z8MMevKtj8go?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af1657e-566a-4ea0-9dc6-08ddafa0080b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 02:13:22.3606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GjR1niHqDEeqEj22rdwUnJbf8F5qvrC3Plh0/QT4y8DUaxqynEE1Z3MvbCxKkDm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7140

On 19 Jun 2025, at 21:54, Zi Yan wrote:

> On 19 Jun 2025, at 16:26, Lorenzo Stoakes wrote:
>
>> Rather than updating start and a confusing local parameter 'tmp' in
>> madvise_walk_vmas(), instead store the current range being operated up=
on in
>> the struct madvise_behavior helper object in a range pair and use this=

>> consistently in all operations.
>>
>> This makes it clearer what is going on and opens the door to further
>> cleanup now we store state regarding what is currently being operated =
upon
>> here.
>>
>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> ---
>>  mm/madvise.c | 101 ++++++++++++++++++++++++++++----------------------=
-
>>  1 file changed, 55 insertions(+), 46 deletions(-)
>>
>> diff --git a/mm/madvise.c b/mm/madvise.c
>> index 47485653c2a1..6faa38b92111 100644
>> --- a/mm/madvise.c
>> +++ b/mm/madvise.c
>> @@ -58,17 +58,26 @@ enum madvise_lock_mode {
>>  	MADVISE_VMA_READ_LOCK,
>>  };
>>
>> +struct madvise_behavior_range {
>> +	unsigned long start, end;
>> +};
>> +
>
> Declare members separately?
>
> <snip>
>
>> @@ -1425,10 +1437,11 @@ static int madvise_vma_behavior(struct vm_area=
_struct *vma,
>>  /*
>>   * Error injection support for memory error handling.
>>   */
>> -static int madvise_inject_error(unsigned long start, unsigned long en=
d,
>> -		struct madvise_behavior *madv_behavior)
>> +static int madvise_inject_error(struct madvise_behavior *madv_behavio=
r)
>>  {
>>  	unsigned long size;
>> +	unsigned long start =3D madv_behavior->range.start;
>> +	unsigned long end =3D madv_behavior->range.end;
>>
>>  	if (!capable(CAP_SYS_ADMIN))
>>  		return -EPERM;
>> @@ -1482,8 +1495,7 @@ static bool is_memory_failure(struct madvise_beh=
avior *madv_behavior)
>>
>>  #else
>>
>> -static int madvise_inject_error(unsigned long start, unsigned long en=
d,
>> -		struct madvise_behavior *madv_behavior)
>> +static int madvise_inject_error(struct madvise_behavior *madv_behavio=
r)
>>  {
>>  	return 0;
>>  }
>
> OK, now I get why you pass struct madvise_behavior to madvise_inject_er=
ror()
> in Patch 2. The changes make sense to me now. Maybe delay that conversa=
tion
> in this one.
>
>
>
>> @@ -1565,20 +1577,20 @@ static bool process_madvise_remote_valid(int b=
ehavior)
>>   * If a VMA read lock could not be acquired, we return NULL and expec=
t caller to
>>   * fallback to mmap lock behaviour.
>>   */
>> -static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,=

>> -		struct madvise_behavior *madv_behavior,
>> -		unsigned long start, unsigned long end)
>> +static
>> +struct vm_area_struct *try_vma_read_lock(struct madvise_behavior *mad=
v_behavior)
>>  {
>> +	struct mm_struct *mm =3D madv_behavior->mm;
>
> Is the struct mm_struct removal missed in Patch 2?
>
>
> <snip>
>
>> @@ -1846,22 +1854,23 @@ static int madvise_do_behavior(unsigned long s=
tart, size_t len_in,
>>  		struct madvise_behavior *madv_behavior)
>>  {
>>  	struct blk_plug plug;
>> -	unsigned long end;
>>  	int error;
>> +	struct madvise_behavior_range *range =3D &madv_behavior->range;
>>
>>  	if (is_memory_failure(madv_behavior)) {
>> -		end =3D start + len_in;
>> -		return madvise_inject_error(start, end, madv_behavior);
>> +		range->start =3D start;
>> +		range->end =3D start + len_in;
>> +		return madvise_inject_error(madv_behavior);
>>  	}
>>
>> -	start =3D get_untagged_addr(madv_behavior->mm, start);
>> -	end =3D start + PAGE_ALIGN(len_in);
>> +	range->start =3D get_untagged_addr(madv_behavior->mm, start);
>> +	range->end =3D range->start + PAGE_ALIGN(len_in);
>>
>>  	blk_start_plug(&plug);
>>  	if (is_madvise_populate(madv_behavior))
>> -		error =3D madvise_populate(start, end, madv_behavior);
>> +		error =3D madvise_populate(madv_behavior);
>>  	else
>> -		error =3D madvise_walk_vmas(start, end, madv_behavior);
>> +		error =3D madvise_walk_vmas(madv_behavior);
>>  	blk_finish_plug(&plug);
>>  	return error;
>>  }
>
> We almost can pass just struct madvise_behavior to madvise_do_behavior(=
).
> I wonder why memory_failure behaves differently.

Based on git history, it seems that no one paid attention to
madvise_inject_error() and the [start, start + len_in] has never been
changed since it was added back from 2009.

OK, it seems that Kirill (cc'd) moved start =3D untagged_addr(start); fro=
m
before madvise_inject_error() to after it at commit 428e106ae1ad
("mm: Introduce untagged_addr_remote()"). It changed code behavior.

So memory_failure should get the same range as others, meaning
madvise_do_behavior() can just take struct madvise_behavior
and the range can be set at the call sites.

--
Best Regards,
Yan, Zi
