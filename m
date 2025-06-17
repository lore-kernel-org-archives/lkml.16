Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9D22BF012
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750154901; cv=fail; b=MfRbZ+F0VKxU5EZT3aOBKOyuvnEGSEReDpoK7JvO6uSmZ4J75mYlg2eV1euw43ZgyE04sCNSownuUrUenrFeOL+xe/Ms8nqHzd2xyZrYbFIAAQdqLSIuRnLrMfUGykboBA4XC7Ehv4zel7Uv0EkkUC0Vq6u+2NyJvv5Jh9cKNMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750154901; c=relaxed/simple;
	bh=bOmZ6BekWcq60Cl3AUmw8BolkXAruIcqqDCVbde+4o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mhzWlZYHDNUWSdTPHiCuVsAUjY7MAEYhdhuR1xrgG+UFVIob4rO29slCtmyMdl5vKuAL2GN8yD7Bo5eXI5z5O/QYDUMZa1G+MPRLOjwISrBNaiJi+AEu8Oh7ITak/RQukmcrbCLPVleSdg3PaZGG37GDciCetTx1ikXfB6hl/hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AplLw1Kb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OdZZAWJh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AplLw1Kb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OdZZAWJh"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8thGr019662;
	Tue, 17 Jun 2025 10:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=nZXGowhb1i0UOprzkU
	YNOLC2HzfzY3jrYViVmSgmcXk=; b=AplLw1KbOK5E7O8XUdSDIXbVzyuG5PxO6q
	JoWKZjedMyqfbo8iS9SsXU8heLE4/dTDuAeDaH/Ht+i0wjqGWO7erEoEwVF6O343
	MMPGZ7jCouijZ5DzpsFLWUMmFEA194KWm4rTQ4hDPNDAQIFgQOM5lU+gboaybjbf
	Sm4cGidPbaijmTjd/IvBFaJuF4JwO2/iaRDH4WzfjvtAl0uxj1zTLkM0mPpLIrzY
	3/+p7A5bDC4ePZjiI7w7XdUdAqcEcrPYXnKWXUfpLV0ZrKrwEusiqBOLdOxP3IOc
	5Lt3LOJOqpNNP2NdnBKMhkjNph/z/JIg5HMed4glPnUrjTBZNUmQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900ew0sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 10:07:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8eK84000818;
	Tue, 17 Jun 2025 10:07:28 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2076.outbound.protection.outlook.com [40.107.212.76])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh91qrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 10:07:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3VlD4P5nUlrhaR0nGuR+2B74KWUzpprFE419t6r9WpPgjvCgsb/sRqn4sSF4yELGVSFboDxiruxboMrNZT9gYrEQ/wMPsCycqCtc4LpyGnRMs5EhEjOY+BQlaWQ4at8Z5peQtsiq/ZiARxU7KFS4zPx6CX9kk8jx6hkoq4W1RlRlG+1YTLX0ubMJVx98kP8/6Y+Lm26Rnz1LE9yd62AnLQKgpZcb2Jzx/TwJTxGCZSri9cREox3mxAGBiBwz6fyDGIX55zP9NH8aZByQmkx7UZUnyytdpCTq+dMnFUcJdE29wA+VBZQwsIO1us58aBQm93iy3qjGa+HyScJycwRVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZXGowhb1i0UOprzkUYNOLC2HzfzY3jrYViVmSgmcXk=;
 b=WKXm85bHkSpvJyOZeojAxxS9lII3pQNR/aORbYhV6heny4DJt3RY1HtG1ncT/S5m8ycOMsVFrcNS48ORURzK8ax7fHKMS3Y5cYTNVRb9+3vW/TwaNnMvoBNb4EBnH0YtgdFV4h7ioP4W4cakG9l7vEyZczA/C/OXubTAyU7FItI7F2+fqyQ39CPQRuIakrEEUt8PkGydmVO79xeKNC7hRmcfMRDigzF6iKmDHH7tGLqS5b5ns349j646OEjxlZ2ME3owWt0M5/Hy2WnieUnBdkaUm69dcQM4cKQqoKVNchyEBIT9dm4wNzT/5s75aPhDltcZVdeTT+g/KZ1xNxK6Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZXGowhb1i0UOprzkUYNOLC2HzfzY3jrYViVmSgmcXk=;
 b=OdZZAWJhJSIRXj77RhFv1wxajjGmlBDa6loltWFhkuMLpd6MDtVr7Xp4E0P9pWr8JDtHWN+gKyzDVmICYkjt7YppKCQ6hbhvupOTcYUrzfDf+FxB4Npr9DZDKDdthOmkHCB5OqA/spEEHHqpuLQOuLNbaq8FSlqR2W+tRQ22Ikg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB6792.namprd10.prod.outlook.com (2603:10b6:8:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 10:07:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 10:07:23 +0000
Date: Tue, 17 Jun 2025 11:07:21 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <d51af1de-110a-4cde-9091-98e15367dda3@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
 <f24dd244-f188-4804-981c-8b7560e5a26b@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f24dd244-f188-4804-981c-8b7560e5a26b@redhat.com>
X-ClientProxiedBy: LO4P123CA0428.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 687495e1-7318-43ee-0fe2-08ddad86c144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w3mtZSZoudo9YqvWxJDJXOBONDP8BQWvM+w6UNf88r1rRrjqbiojvES7JUZF?=
 =?us-ascii?Q?F5HKcXWp1NdqbBVgpckCuXPOOzYCofU37csam1+FzGKuaTFnicLzu5Rouce0?=
 =?us-ascii?Q?FJ9XrvyKSzgDtefvNo94/49jopsEu/jLarEAHO9YKbKHuW5piXs6IvIgNXfV?=
 =?us-ascii?Q?f85XtxILijhuA4pexpcLnBoSSN6wTbdvvUEsyHRIyHKNcLFTiE7iwodusEgQ?=
 =?us-ascii?Q?LtLH9ArJSRuhMm1nROdvQEFePFev1rM6ju2u+z3Fv42tagKizNqZ+X3Rp1yC?=
 =?us-ascii?Q?QVopZYJMGDBHU8X10ssvf42XHvNe1Bjt8KzvS/4+gIiIUBjEN7G0xVzjEXFh?=
 =?us-ascii?Q?jx8L2yKTnutuC+uPRfkNEvP8NNAfWdMOaugk82Y62fl4FaB2Qnj0HFXQuE/B?=
 =?us-ascii?Q?ZF4NmOeOrQBzBSTHFUYtM0SbpHk3WEfbyKLU/6xwmxAXlSgE6JWZWEj267rZ?=
 =?us-ascii?Q?qPsz6wRqHeDXe9cnjkJARalGOngeP6dcXSf2HRWwZNUKBl1HGQy8kpk9pWys?=
 =?us-ascii?Q?vjZ/Fu8V2H7pDolPeH9DRr9EqIHKRV+4Qb+FacZCMEjq8I1xQaXh/KRppLef?=
 =?us-ascii?Q?p4ztZkseEQ1M2197ayH8axgyTOsIRLM8LohrJZiUe6Yb6Q8Sw5zhysMAwGwU?=
 =?us-ascii?Q?0vLUP4xrr4n7ZeQHBj1KksaNA8tCCwmHswlQnyElYVwJdUK8WbAm9AYM0KXc?=
 =?us-ascii?Q?KoObDfmFRP46Z8NDogObqGcPW+zH9xMMdmuMqLMIbHdBjrqm4YNDJeIe6L3A?=
 =?us-ascii?Q?C52XlHFLEIYIW+ccBaNqnnPw7LYF0z2vRhahdYPXfmciP95kP61Dq5WbFU/1?=
 =?us-ascii?Q?FgAYT+aALqE549Zz8rnE2NM3I2LfCCwCOWJu5EbHf7xalp68K7lLA8FUA5j4?=
 =?us-ascii?Q?TxLopn75TZJhgCA9+C7m8enaZff4plQvkH+NNx2AXUwgjqLBv6CzflSrh5js?=
 =?us-ascii?Q?2SRWBYbmrEhMrkCMn1UOivjmmemTsK01t6omYK5/G5/krGjFlNKHrxiMFmOw?=
 =?us-ascii?Q?IByEKmLAruVBU2yg1qomf3Wc94AZT5rq4NFnsV3MNh5lm6u6sC6miu8Gfu2b?=
 =?us-ascii?Q?EzZpph1wvzqpRSi87Xn7/Av5UeBMafWYwXIDBP7DRHNaqAwHWn1EGWSiItEr?=
 =?us-ascii?Q?olgLss56V0VtnXxWFGex8vGT07rookH08eUwaB4iPqTl7OpXoSfPKaPx2Odd?=
 =?us-ascii?Q?s/QjestZ8IyWeU/knoL+COWC1OQShULnXtVO0SlpBHSTBFo+GynINGucHC4e?=
 =?us-ascii?Q?hjgPywk/HSMkqgolHn3i0DK6TcaCXrgEbBh5Azpibvzf49yUHtSsPxPlMRTY?=
 =?us-ascii?Q?qxwPcA0SgbjooiaDT5MczM1B2agDLGHsf3wjcnVnYIHU7XhZj2QYqyVyF4Bg?=
 =?us-ascii?Q?WhQUOLL9EAWmTWVYCf/lfq5IQo9efnwl6j5nv5nVD8bp2jp2Og=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wed+PDvikqbLo/kg8OxWg8XdaokuSRnqtY5VpRhlvAwILjtk4/Ahp+n34AC4?=
 =?us-ascii?Q?I95gyUz+r0Cbs0bSfd8iep7TMF0BrahCe+A++hqgbFoDCi2tGuKb8AS+uyUv?=
 =?us-ascii?Q?zdQPnL1MeK9UFfE1eOcxz/jcpYPXq225OmqIwtBoU4qAOKgKeusYyR3Jnamu?=
 =?us-ascii?Q?2SCPojHCfiQDsWloPi0Lg23U/Gz0uHDD2Fk1vqFqQzMkzaG/WPzL3Se4uYxE?=
 =?us-ascii?Q?+/moQgHdkiZD/4ot97PUttFZEpw9VRj+Wd8Mvkj09/hOfz3Fvpdn+BwMoWF2?=
 =?us-ascii?Q?UJG20ZBnPyX6TZvLf7Yb2z5RhdFoZGafNi9/red+NraDUma7+126Pq/wuXWV?=
 =?us-ascii?Q?wdSckaybnNY6imMbeGnY0qBnnsNjElDpOc0t1UQgsyjT3f9khx2V5s01/o0c?=
 =?us-ascii?Q?xTSGBdviNDErz1A7tZ6hs7Um5C6r2GfwTzegARJGG77Hu+5JrjdethiH8+A/?=
 =?us-ascii?Q?SPc9TkAHTqCxhPQA0u6B4H8a2pataK5ZX87yW1s5jXsN2Ni1Nbdp3apLDkY5?=
 =?us-ascii?Q?jvDVW4gZinpPzRZqSkmPi4/qBSqlxE7wLDes+I9pdYICXxyEYxQNnCE1vYEg?=
 =?us-ascii?Q?m/Rpeb01qB0b4i8OQJi5ks42nRE8PhD4oh620Pf74Ol6+P5TVlTkFhPRMQJ1?=
 =?us-ascii?Q?JLcz5JxEt/eeZLSIOz/1QcgLAuZyaPP8aLCAkWYfRfXwxqQw17I7mv0S8bSi?=
 =?us-ascii?Q?492SqjMnmvY5BF8a850eFIsU9yO3yrbQ9BtGW2bBdudorKOOb2fspn6nKRv/?=
 =?us-ascii?Q?+MZzlOwuNXskldJDOD5kncybLguW8H8GvPhbqxa2QDAXjSid8VQTBYR+ADoB?=
 =?us-ascii?Q?I4LNP3kgxvnwHXFJh2MERNORDpZrnQCM57waIBCUgordokSJS+HWAAf6aefM?=
 =?us-ascii?Q?QrdKtIwRfLSPpbBqBjinbeTudCYERilVGhJTfKXSoG3g8Lq0H1FUUMY9jsY5?=
 =?us-ascii?Q?3sDRHpvqJrh4DgnG0QYP1Qx4QrpgiV3EFOr2OSqJstfO06EeBlMauy/NNtJ3?=
 =?us-ascii?Q?8peCGwqCh4wj6Y7+u4wD3/dGsVSWR5Oo1SFjs2kxL9m2kejByxNUN67HTXO5?=
 =?us-ascii?Q?V+ZyqLtmk49E9VvL10DpUWhyz6IU2S5XTdPh6pN9DLvpMKvur9VMeEIa1G91?=
 =?us-ascii?Q?A5BfebzwOpsWMT0QtL2uWUrBB9OC1o+4x69+2RzfM8FO8k2LM6UPXmvth2Zo?=
 =?us-ascii?Q?rDBO3ujtgGk5wh6WTXBPlNUgYNfh9+66fYI3nl9WsXiVmVkHiCqfboEx0rSC?=
 =?us-ascii?Q?zmAVSIIKOrKejczsyS4yqKLLtLwUHbO5t5V8y+UiJJYa4SU3HJXycwbl4nT1?=
 =?us-ascii?Q?b9T1awX6GPvAUXD9OYigSt2PpHhnqdcIXtP8RT81Un6FbH6OmsmbgA5NEZaY?=
 =?us-ascii?Q?iAfMpLr072hTgvmiFYYk2jhwjUeC8Iguj/eBboKnK8hw7XbDfgo14Ne4pHCM?=
 =?us-ascii?Q?ODqRE9GJfFL0eFLlbIkOLK9kK0oxKDdHGAIyIDAJe1bpzd8JEq0C50HFhCZm?=
 =?us-ascii?Q?+yOZmkHYe0OQn26Jt99NK+ukVnmw8EZGfEiZocqFZDDQI7Haorfu9E+Uqn4l?=
 =?us-ascii?Q?YxCnOcEDWkejAlNbS3qRIRqVKbV5wB1qh9YSL7Z/6VmXJbQpfWMqww68VOFA?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QRo0TifepzkMN1j0gJxMhLgJe5CnGf0JWlKl10I4PHeg0Ddk7Vl2yLrPqKEzulvmLzpKqN+d7sX2YfmobnvF1UPHxsrgVoJVbOVbTUSCk5t6Eri6MnpBM+qwcdESEtY62BbOBszHC7eZI6xiJYqsdyqAXs/QxiJFnmqWGmylMzDPaPH9d8bn+SrJuDEEqPfgtDT2+5iRah0qOGBhfr6dUBAoAOlJQjIWQbythyzYWa8uddA38ah/435K7ET2/WEryBfIjJwtOHGXmZrqT8+Q/+Pr9CrQkc4qVox29BVDh1cp5l4nlrsq81OyYTYVyUEVK8Hk2wpu5nWhAbBu5RTlxQOSUCEwvNBFAb2d5n+cmKTsA+Za1keYogzLULUkat6M+PSFnoD/HlXLSiFEpip09OnUZNZvD0O1UhvAtDa7epb+YZTW25h+gsRpbWWQOpxaGXrSwCwzGj8gYUgpkVJFCyThpm973lqlIV0okzCXieAjxFMm02Gz2OTtdEvhtqM5Sb7Oq2VpGHrxyKzPKJsxk1N4k+OFO9Zodd213hep1AmVmKj8LlALStoOuWHCOYcvIfsDiOzZyu60S6LHJ+liLzw/4BE6qa0uVsThlMs/ocI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687495e1-7318-43ee-0fe2-08ddad86c144
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:07:23.7929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPnA7F3I+/EXyAEHM03zCNyW9GtUSUZcNuSd7y/eImr+uEIsHoo5iYxguoMOKbxt1mJ+2w1NcVx6PQ4wDX1cjJmUmcm7+ZvIkSOaLonHl6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6792
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170082
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MiBTYWx0ZWRfX96jJHIwlL4wE KjaZXZnXatShAlMmAxDcO40F5jElx6LaZzC9hJfs9sfWsG+X/eDM9I9EoC3AcbsrV0dPZrtlKtX dIeAamnvZYTVTgh4bawUqB+poM4qxp7tvs2r1Au0l2xwe8xjOWGwbim8lkqI8FofA0PeXHBOk5K
 FdQrPOK4T03lNXTBJy8H9Dn2PvXMvvVKKsIKqMel33U9CtR6ylhJEbSvlJcO7rhIIf2Xm9ruc7U UX34jd3PtwEaBLvLygED7LYDwWCelrvOLVwljVLGEbKtmcHTM2PPQ29sbg6huzwyZD8gJja1//X A/hPkwyagcENz+9y/eom3L1ZCxFixB3up6TYjNGtyQXZq2oRyYvy3CE1G77M1kHQMpQc8BaRhRM
 wSht5l8GfsPHBocVcG5pl5MjH1CRlO1tlsMU9tGxwPpR/KXtAjg+ValVjMZligZYUdiiA7S8
X-Proofpoint-ORIG-GUID: vtPrlE5WFjgYfhwjv-nTV2OucTEem-Nu
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=68513e62 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=wYy16snYq8TrkiF0aKcA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: vtPrlE5WFjgYfhwjv-nTV2OucTEem-Nu

On Mon, Jun 16, 2025 at 10:58:28PM +0200, David Hildenbrand wrote:
> On 09.06.25 15:26, Lorenzo Stoakes wrote:
> > When mremap() moves a mapping around in memory, it goes to great lengths to
> > avoid having to walk page tables as this is expensive and
> > time-consuming.
> >
> > Rather, if the VMA was faulted (that is vma->anon_vma != NULL), the virtual
> > page offset stored in the VMA at vma->vm_pgoff will remain the same, as
> > well all the folio indexes pointed at the associated anon_vma object.
> >
> > This means the VMA and page tables can simply be moved and this affects the
> > change (and if we can move page tables at a higher page table level, this
> > is even faster).
> >
> > While this is efficient, it does lead to big problems with VMA merging - in
> > essence it causes faulted anonymous VMAs to not be mergeable under many
> > circumstances once moved.
> >
> > This is limiting and leads to both a proliferation of unreclaimable,
> > unmovable kernel metadata (VMAs, anon_vma's, anon_vma_chain's) and has an
> > impact on further use of mremap(), which has a requirement that the VMA
> > moved (which can also be a partial range within a VMA) may span only a
> > single VMA.
> >
> > This makes the mergeability or not of VMAs in effect a uAPI concern.
> >
> > In some use cases, users may wish to accept the overhead of actually going
> > to the trouble of updating VMAs and folios to affect mremap() moves. Let's
> > provide them with the choice.
> >
> > This patch add a new MREMAP_RELOCATE_ANON flag to do just that, which
> > attempts to perform such an operation. If it is unable to do so, it cleanly
> > falls back to the usual method.
> >
> > It carefully takes the rmap locks such that at no time will a racing rmap
> > user encounter incorrect or missing VMAs.
> >
> > It is also designed to interact cleanly with the existing mremap() error
> > fallback mechanism (inverting the remap should the page table move fail).
> >
> > Also, if we could merge cleanly without such a change, we do so, avoiding
> > the overhead of the operation if it is not required.
> >
> > In the instance that no merge may occur when the move is performed, we
> > still perform the folio and VMA updates to ensure that future mremap() or
> > mprotect() calls will result in merges.
> >
> > In this implementation, we simply give up if we encounter large folios. A
> > subsequent commit will extend the functionality to allow for these cases.
> >
> > We restrict this flag to purely anonymous memory only.
> >
> > we separate out the vma_had_uncowed_parents() helper function for checking
> > in should_relocate_anon() and introduce a new function
> > vma_maybe_has_shared_anon_folios() which combines a check against this and
> > any forked child anon_vma's.
> >
> > We carefully check for pinned folios in case a caller who holds a pin might
> > make assumptions about index, mapping fields which we are about to
> > manipulate.
>
> Som quick feedback, I did not yet digest everything.

Thanks for taking a look! Appreciated :)

>
> [...]
>
> > +/*
> > + * If the folio mapped at the specified pte entry can have its index and mapping
> > + * relocated, then do so.
> > + *
> > + * Returns the number of pages we have traversed, or 0 if the operation failed.
> > + */
> > +static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
> > +		struct pte_state *state, bool undo)
> > +{
> > +	struct folio *folio;
> > +	struct vm_area_struct *old, *new;
> > +	pgoff_t new_index;
> > +	pte_t pte;
> > +	unsigned long ret = 1;
> > +	unsigned long old_addr = state->old_addr;
> > +	unsigned long new_addr = state->new_addr;
> > +
> > +	old = pmc->old;
> > +	new = pmc->new;
> > +
> > +	pte = ptep_get(state->ptep);
> > +
> > +	/* Ensure we have truly got an anon folio. */
> > +	folio = vm_normal_folio(old, old_addr, pte);
> > +	if (!folio)
> > +		return ret;
> > +
> > +	folio_lock(folio);
> > +
> > +	/* No-op. */
> > +	if (!folio_test_anon(folio) || folio_test_ksm(folio))
> > +		goto out;
> > +
>
> So these cases are all "pass".

Yeah, this is maybe not entirely clear. But it's more like 'we don't need to do
anything with these'.

Really we shouldn't be encountering non-anon folios here given we've checked the
VMA but if we do, somehow, then nothing to do.

>
> > +	/*> +	 * This should never be the case as we have already checked to
> ensure
> > +	 * that the anon_vma is not forked, and we have just asserted that it is
> > +	 * anonymous.
> > +	 */
> > +	if (WARN_ON_ONCE(folio_maybe_mapped_shared(folio)))
> > +		goto out;
>
> Good a warning, so we should be able to handle that early.

:)

>
> > +	/* The above check should imply these. */
> > +	VM_WARN_ON_ONCE(folio_mapcount(folio) > folio_nr_pages(folio));
> > +	VM_WARN_ON_ONCE(!PageAnonExclusive(folio_page(folio, 0)));
>
> This can trigger in one nasty case, where we can lose the PAE bit during
> swapin (refault from the swapcache while the folio is under writeback, and
> the device does not allow for modifying the data while under writeback).

Ugh god wasn't aware of that. So maybe drop this second one?

>
> > +
> > +	/*
> > +	 * A pinned folio implies that it will be used for a duration longer
> > +	 * than that over which the mmap_lock is held, meaning that another part
> > +	 * of the kernel may be making use of this folio.
> > +	 *
> > +	 * Since we are about to manipulate index & mapping fields, we cannot
> > +	 * safely proceed because whatever has pinned this folio may then
> > +	 * incorrectly assume these do not change.
> > +	 */
> > +	if (folio_maybe_dma_pinned(folio))
> > +		goto out;
>
> As discussed, this can race with GUP-fast. SO *maybe* we can just allow for
> moving these.

I'm guessing you mean as discussed below? :P Or in the cover letter I've not
read yet? :P

Yeah, to be honest you shouldn't be fiddling with index, mapping anyway except
via rmap logic.

I will audit access of these fields just to be safe.

>
> (after all we still have ordinary GUP that would also not be covered by this
> check)
>
> > +
> > +	/*
> > +	 * This should not happen as we explicitly disallow this, but check
> > +	 * anyway.
> > +	 */
> > +	if (folio_test_large(folio)) {
> > +		ret = 0;
> > +		goto out;
> > +	}
>
> That is the only real problem for rollback so far I assume.

Well, this becomes ultimately irrelevant in a later patch where we indeed
support large folios.

>
> > +
> > +	if (!undo)
> > +		new_index = linear_page_index(new, new_addr);
> > +	else
> > +		new_index = linear_page_index(old, old_addr);
> > +
> > +	/*
> > +	 * The PTL should keep us safe from unmapping, and the fact the folio is
> > +	 * a PTE keeps the folio referenced.
> > +	 *
> > +	 * The mmap/VMA locks should keep us safe from fork and other processes.
> > +	 *
> > +	 * The rmap locks should keep us safe from anything happening to the
> > +	 * VMA/anon_vma.
> > +	 *
> > +	 * The folio lock should keep us safe from reclaim, migration, etc.
> > +	 */
> > +	folio_move_anon_rmap(folio, undo ? old : new);
> > +	WRITE_ONCE(folio->index, new_index);
> > +
> > +out:
> > +	folio_unlock(folio);
> > +	return ret;
> > +}
> > +
> > +static bool pte_done(struct pte_state *state)
> > +{
> > +	return state->old_addr >= state->old_end;
> > +}
> > +
> > +static void pte_next(struct pte_state *state, unsigned long nr_pages)
> > +{
> > +	state->old_addr += nr_pages * PAGE_SIZE;
> > +	state->new_addr += nr_pages * PAGE_SIZE;
> > +	state->ptep += nr_pages;
> > +}
> > +
> > +static bool relocate_anon_ptes(struct pagetable_move_control *pmc,
> > +		unsigned long extent, pmd_t *pmdp, bool undo)
> > +{
> > +	struct mm_struct *mm = current->mm;
> > +	struct pte_state state = {
> > +		.old_addr = pmc->old_addr,
> > +		.new_addr = pmc->new_addr,
> > +		.old_end = pmc->old_addr + extent,
> > +	};
> > +	pte_t *ptep_start;
> > +	bool ret;
> > +	unsigned long nr_pages;
> > +
> > +	ptep_start = pte_offset_map_lock(mm, pmdp, pmc->old_addr, &state.ptl);
> > +	/*
> > +	 * We prevent faults with mmap write lock, hold the rmap lock and should
> > +	 * not fail to obtain this lock. Just give up if we can't.
> > +	 */
> > +	if (!ptep_start)
> > +		return false;
> > +
> > +	state.ptep = ptep_start;
> > +	for (; !pte_done(&state); pte_next(&state, nr_pages)) {
> > +		pte_t pte = ptep_get(state.ptep);
> > +
> > +		if (pte_none(pte) || !pte_present(pte)) {
> > +			nr_pages = 1;
>
> What if we have
>
> (a) A migration entry (possibly we might fail migration and simply remap the
> original folio)
>
> (b) A swap entry with a folio in the swapcache that we can refault.
>
> I don't think we can simply skip these ...

Good point... will investigate these cases.

>
> > +			continue;
> > +		}
> > +
> > +		nr_pages = relocate_anon_pte(pmc, &state, undo);
> > +		if (!nr_pages) {
> > +			ret = false;
> > +			goto out;
> > +		}
> > +	}
> > +
> > +	ret = true;
> > +out:
> > +	pte_unmap_unlock(ptep_start, state.ptl);
> > +	return ret;
> > +}
> > +
> > +static bool __relocate_anon_folios(struct pagetable_move_control *pmc, bool undo)
> > +{
> > +	pud_t *pudp;
> > +	pmd_t *pmdp;
> > +	unsigned long extent;
> > +	struct mm_struct *mm = current->mm;
> > +
> > +	if (!pmc->len_in)
> > +		return true;
> > +
> > +	for (; !pmc_done(pmc); pmc_next(pmc, extent)) {
> > +		pmd_t pmd;
> > +		pud_t pud;
> > +
> > +		extent = get_extent(NORMAL_PUD, pmc);
> > +
> > +		pudp = get_old_pud(mm, pmc->old_addr);
> > +		if (!pudp)
> > +			continue;
> > +		pud = pudp_get(pudp);
> > +
> > +		if (pud_trans_huge(pud) || pud_devmap(pud))
> > +			return false;
>
> We don't support PUD-size THP, why to we have to fail here?

This is just to be in line with other 'magical future where we have PUD THP'
stuff in mremap.c.

A later commit that permits huge folio support actually lets us support these...

>
> > +
> > +		extent = get_extent(NORMAL_PMD, pmc);
> > +		pmdp = get_old_pmd(mm, pmc->old_addr);
> > +		if (!pmdp)
> > +			continue;
> > +		pmd = pmdp_get(pmdp);
> > +
> > +		if (is_swap_pmd(pmd) || pmd_trans_huge(pmd) ||
> > +		    pmd_devmap(pmd))
> > +			return false;
>
> Okay, this case could likely be handled later (present anon folio or
> migration entry; everything else, we can skip).

Hmm, but how? the PMD cannot be traversed in this case?

'Present' migration entry? Migration entries are non-present right? :) Or is it
different at PMD?

>
> > +
> > +		if (pmd_none(pmd))
> > +			continue;
> > +
> > +		if (!relocate_anon_ptes(pmc, extent, pmdp, undo))
> > +			return false;
> > +	}
> > +> +	return true;
> > +}
> > +
> > +static bool relocate_anon_folios(struct pagetable_move_control *pmc, bool undo)
> > +{
> > +	unsigned long old_addr = pmc->old_addr;
> > +	unsigned long new_addr = pmc->new_addr;
> > +	bool ret;
> > +
> > +	ret = __relocate_anon_folios(pmc, undo);
> > +
> > +	/* Reset state ready for retry. */
> > +	pmc->old_addr = old_addr;
> > +	pmc->new_addr = new_addr;
> > +
> > +	return ret;
> > +}
> > +
> >   unsigned long move_page_tables(struct pagetable_move_control *pmc)
> >   {
> >   	unsigned long extent;
> > @@ -1134,6 +1380,67 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
> >   	}
> >   }
> > +/*
> > + * Should we attempt to relocate anonymous folios to the location that the VMA
> > + * is being moved to by updating index and mapping fields accordingly?
> > + */
> > +static bool should_relocate_anon(struct vma_remap_struct *vrm,
> > +	struct pagetable_move_control *pmc)
> > +{
> > +	struct vm_area_struct *old = vrm->vma;
> > +
> > +	/* Currently we only do this if requested. */
> > +	if (!(vrm->flags & MREMAP_RELOCATE_ANON))
> > +		return false;
> > +
> > +	/* We can't deal with special or hugetlb mappings. */
> > +	if (old->vm_flags & (VM_SPECIAL | VM_HUGETLB))
> > +		return false;
> > +
> > +	/* We only support anonymous mappings. */
> > +	if (!vma_is_anonymous(old))
> > +		return false;
>
> I suspect MAP_PRIVATE file mappings should be easy to extend?

Yeah, but perhaps best to be conservative at first.

>
> [...]
>
> >   	pmc.new = new_vma;
> > +	if (relocate_anon) {
> > +		lock_new_anon_vma(new_vma);
> > +		pmc.relocate_locked = new_vma;
> > +
> > +		if (!relocate_anon_folios(&pmc, /* undo= */false)) {
> > +			unsigned long start = new_vma->vm_start;
> > +			unsigned long size = new_vma->vm_end - start;
> > +
> > +			/* Undo if fails. */
> > +			relocate_anon_folios(&pmc, /* undo= */true);
>
> You'd assume this cannot fail, but I think it can: imagine concurrent
> GUP-fast ...

Well if we change the racey code to ignore DMA pinned we should be ok right?

>
> I really wish we can find a way to not require the fallback.

Yeah the fallback is horrible but we really do need it. See the page table move
fallback code for nightmares also :)

We could also alternatively:

- Have some kind of anon_vma fragmentation where some folios in range reference
  a different anon_vma that we link to the original VMA (quite possibly very
  broken though).

- Keep a track of folios somehow and separate them from the page table walk (but
  then we risk races)

- Have some way of telling the kernel that such a situation exists with a new
  object that can be pointed to by folio->mapping, that the rmap code recognise,
  like essentially an 'anon_vma migration entry' which can fail.

I already considered combining this operation with the page table move
operation, but the locking gets horrible and the undo is categorically much
worse and I'm not sure it's actually workable.

>
> --
> Cheers,
>
> David / dhildenb
>
