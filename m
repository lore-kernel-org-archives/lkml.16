Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA22D5420
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 17:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751564381; cv=fail; b=aE0DKODY2BrTYkT1hjm/SOmvUjNcVjjPKhiCPzjg8gyUJhePNsQeO3rt7B/5gY+p1nZd5ojfwbSYmgyvA0DMuaQTx85vAvnZDMvzsNf99xZQWLeHBUCWZFk+RvUbL9kez6dYKfZonVJzPCtgGn/w211zbBdRRBW6M4E0WJvpCCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751564381; c=relaxed/simple;
	bh=H8/pxPJQn1r//ZHTBQDCYBzgabevkVjThsCAgF3lnU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JMcLNBl2/J3pmLIJLZkCkAMeXkUJ8WVqQjl1VsnhqReZl8a7b4hyIFEUchLkwmW3QV2zSj8ZqidHdvVEptYC1VlOjwHOU1stQ3+VJKhzqjIacJRpi5hnc8KupQ0BBqzZzypd6DndjByAKtWBp/khrrsMVeWpbkREd6rbFIr32lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lQbs0YQB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vw6yF/3L; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lQbs0YQB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vw6yF/3L"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HZ5S1027861;
	Thu, 3 Jul 2025 17:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=SSZh7XzP/zOMWGpux1
	jRDeHYDVT2pgzCuTMHrDrJN6A=; b=lQbs0YQBZ0i80bmm7AiBeO+Rik4t8yIkr5
	II0OOja8YvQhhv4kHOxim9Hvoj6a4Rtc1JkyndJvHCsOUJQdScRKfa0CwC5XE3Sk
	QBqwLttVuHutkeFWsNI7hL2fRnL9ATq4ASnElSukWsdAUb07J4yYh7vMc+fbHO3r
	ErQd05uHrUhgRNzxOllDNJyrm9W+X975LMOEz6op1jYYSUzdUusil8Y+O3QPT8RP
	yMYAHTQzngn2xiWNnHYVwifDkVxiAtqQCNP3IQTYZ3i2eCDMZSJqRMjMLy7ZDSIR
	CJnaMjtNdKL60a779XexOg7isptZqt9X+jOFdjzTg341Jz698RwA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx9g05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 17:39:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563H0uoG024062;
	Thu, 3 Jul 2025 17:39:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1hq8pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 17:39:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Laqc9bhhn/T5zU4zBwwbbdvkcoDv7pIr+BEnatQrtZX5WiWelWLSaucKle0/o+eItcoTMb0+hp8sTdDbfD9RAJA2mjwl0EGGzbfobCPxhgxTRkfPEWFtrL3TF0EHuxB9grr5jZ+zUaI6EoU0TJe3zQjRSYiK/m8fnaCjKk2fWxkQwT71ijf91PkTGEeTg5irIgTbfPWhE9sjNZaGYzOSGdG8r3Sj0gtJKlzOzYHZQqSaJMNFKv2we8WYhjeQZ6AqTuOnZlFTsdDWTsWPSeT1pd71RtJxuQm0spdM7i/tV0UO4FcoQMq8vMDuBkiAzoXj3FN3yA8AFWks8pmT6aTyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSZh7XzP/zOMWGpux1jRDeHYDVT2pgzCuTMHrDrJN6A=;
 b=b6nNI3Xtb5z0Kxt3+j8VsFSbfLNr79EtD4J6EdMk9TFLOWaRpSCgtBTyAd88o65hFsqbwP8Fc0Z2qSEZnf6Fpe5sDEMQeSo3cpPXO/xLhjsjdNgOpJOthEkIpyZqd1A5wQGI6V1hsVetMcH/603aGvIvnW+PBLa8fshtRk3lR1vTG/9R0tesAxxrIC9nHCFE+Paix87wIi1wHI3eOYg3+9Tth8CK7Ma/T/YO8I1pUvnN7IWfYMviMtMBiHxAUMCTUcshKflOPp4NjhfxhUFAWWpJ4X3KRV/DirFrt47FyKScUpbjGRkyf9KBLJ5h2ZEjbt6p1auyzrDxSxKT25swdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSZh7XzP/zOMWGpux1jRDeHYDVT2pgzCuTMHrDrJN6A=;
 b=vw6yF/3LDe/lIqfg2FiGUUiSIVMiL+l994hn+XxQ10edzCWoiq6ZzBwpEjvJfXs8DF7iAF0OjtQWo6k7W+TVl5iKRGrBNMOYr84tuQtqX18YEodn0j65Q4jnSUImWcBVM8gMGtqVaXFUT/UmVtKR5GIHl+gm3mCYyogwHGP+qa4=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH7PR10MB6401.namprd10.prod.outlook.com (2603:10b6:510:1ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 17:39:08 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 17:39:08 +0000
Date: Thu, 3 Jul 2025 13:39:04 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: Nikita Kalyazin <kalyazin@amazon.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <5ixvg4tnwj53ixh2fx26dxlctgqtayydqryqxhns6bwj3q3ies@6sttjti5dxt7>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Peter Xu <peterx@redhat.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, 
	Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, James Houghton <jthoughton@google.com>, 
	Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, 
	Andrea Arcangeli <aarcange@redhat.com>, Oscar Salvador <osalvador@suse.de>, 
	Axel Rasmussen <axelrasmussen@google.com>, Ujwal Kundur <ujwal.kundur@gmail.com>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
 <rsumpavnbe63jvfz7w63batked4obgnzmz4boeee6q3wiv7smi@rkok2a4vug72>
 <aGWmZKwcpLMfAN2O@x1.local>
 <htdtwazk66dcrfkpwh5fgtk5ruzzo2zy54i5w6kbg45lqtyect@tt22z7hcdfnx>
 <aGagpUkNogTxS7dk@x1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGagpUkNogTxS7dk@x1.local>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT3PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::24) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH7PR10MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef5bcd2-d4a9-4802-004b-08ddba58839d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S1ex38/4ctioXv8orjOtABAdJ0lEBBwpeowxLHIIoCSu4T+AlcNTJLSH1W1o?=
 =?us-ascii?Q?2fFCzotgMmWUnRTAiTK0jKh2UXDIbL/Yh9zJ6BmHNk9xCtmMFHG0teZso/ZP?=
 =?us-ascii?Q?tGem/OYBkRyDvKu/KilgqoDwufQCMnWtRN7ljGg82dbcoH63yd8Y1NB3Uu96?=
 =?us-ascii?Q?r5427ymD3YqTtlr5CkzWKaS+OFuuRXyQx5+hNcrI8hMEo7XGnoBfT4rcLQw8?=
 =?us-ascii?Q?zC0ilUWtDZVpm+scu4Ad+yTTaB5sofMo2Ipao5ZlKFgDNYIT/GB0vXugYu8F?=
 =?us-ascii?Q?UykeWZa74W1YGQ9hoinCe8j9i7qjZrwVykfyGEHhqj9GcoojBtYUpJwB/uHc?=
 =?us-ascii?Q?jUK8fLe+X5gFRJ1fXMPTvqsh5ZG4m98+63i1hLwzJ39i3HCcf64Sp7Itci/E?=
 =?us-ascii?Q?FAlwGaNQ5k9H1qilQSob1c6YQmDmXn4WzmvPuCQrMdsdp9i3L0v6XreeVp5V?=
 =?us-ascii?Q?OngIabE+5z8ZOUKttNE+14K+pgnyA9wMOCIOZqDszcX1EtQy4ycRfdhx0apo?=
 =?us-ascii?Q?hr/WvTKgbruGXUAvi2Qxa2uM+vCkU2Shje+cPfw7GzWUtKzJVpIY/NNh8UsE?=
 =?us-ascii?Q?ACfxZD1VZe3HGoKcIVD0exhqjeR9HB/qxNpEy8BlmuZrwj3tKyn2zUwoO/lw?=
 =?us-ascii?Q?LWzMURz8OTSfFJsjjuJU//t7Ly6x9j9K07owW/qMDpnDMQx/+mCMzDkyv4Wc?=
 =?us-ascii?Q?oGbiVLHNeSNOEeQw+DAVRHK+xzRNI77/d6JRZTURZQzS+uUB840IkOsrcPrS?=
 =?us-ascii?Q?oMx2hepMcWaieWCDFazZ/Z0x9xtKFvm1MQ67L2jkW+Y+OV9qw96yXLNPPIJr?=
 =?us-ascii?Q?9WRSpnLG+kknC4SXxweNyBbQ2o+x8xRAhv+OwCXkhEdQ3ZO+t90g5Gthe7cA?=
 =?us-ascii?Q?Rlo/4Njd3jc6DqniaMcARWr2qIfqxqfYNYdtjGPONHkIKlh4wQrIct/a7ie7?=
 =?us-ascii?Q?DezlBJGypuJH65iHiji7B1BLF5olAk+HXDewxZhDX0gtVHOs8axzcaWdYBng?=
 =?us-ascii?Q?jTlh2UQVQMTTaNYadWUhfjU0LCdwwsX+GOI38FTi+HsUFCWSK69Q1G5L3GP9?=
 =?us-ascii?Q?tYdK8dlTcb0U2a/712z1PspAsmES/36D714uw4YoY0rdju8UJZ759eRmlDJJ?=
 =?us-ascii?Q?b+h1VhLmYOrwtfeOfXZsX7UDKBshlgRFogL12m0XIvzbPhqCJM/+9bZDXarH?=
 =?us-ascii?Q?CPBFr0K6InHChs3y1zRllh5LCynh1ICrMcXBJLYUPVHnn4w0VXr0+HEfiLJ5?=
 =?us-ascii?Q?qbXXOeNhqtnzxH7r//WXLEVeSve8nfG2Vh64ztDlS5A9Efu5jv8MRWOnhuYC?=
 =?us-ascii?Q?y2mU8Kug+leL8j/1jhFYUVzknm+SGgCpBBItgLjzv4+8zx68bXn6+7IOVw9J?=
 =?us-ascii?Q?gpb0KnEB+Mz//9/Jd9eUIzqTlLvHD+VMNo6B+SrKv6luH+2kubuNa0TdAGsm?=
 =?us-ascii?Q?TFzr8VFyaZI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m09jE2TGIShwlfTURh8MbJZQihPgEGsgINM7jRzRAHsmSvZrEHha9Wb4r3Ex?=
 =?us-ascii?Q?6Dl/HHtH/qRz4LWF2C/ApI/y0erJQe8XTt65S4KjlSByvk/KA2U5Gk5WK94u?=
 =?us-ascii?Q?zg/u9RNcNPXnbaabsnJZaZrbAJx+f0F03hK8kvsKKjeYU+3rB8wED0FjavbB?=
 =?us-ascii?Q?+Sz6g8NKht+eiA2jLo5UKPH0OTacbumLn92GbZrKCdSPO83j/RhWuwcoaim4?=
 =?us-ascii?Q?Fy2ou0EHa2rhO/kHZd+GcxWOjm8rAxfHsj/wYBLedPBJ5xcM3vrHPQbmD7nx?=
 =?us-ascii?Q?ESPEgkL8qjrDK+fh+yzIcAys8yzJSbD6NxHjeGFQ2nzOZ3r+gsmRcVewhDyW?=
 =?us-ascii?Q?6mu3UtoTJvZN3zguFGMqDpk5INgcX/wdhtrnG+toETMJCjlGOIdM/FsDL7ey?=
 =?us-ascii?Q?JNIAdCnpaSGbklsshpvAI+/YAa91hbyyPCq443hOU+cjVyVAI3r19ZnO/Ax+?=
 =?us-ascii?Q?PP/BQ0P45ZUsJqCfOOPSOElUa024mkOFE/QB+R+AfqkolAYtTlGjijKBjbgx?=
 =?us-ascii?Q?uK6p+u5Jn+79et+g+CcCnOFcuCe6sheCmtC/LLlX/J395s/Ro/6GNzlf8+aA?=
 =?us-ascii?Q?AhUAb+TXs3Im04DoYi3IQ3jiqtlbbMQYzZKpOUzAj84H2KR+1x4scCT6V3wE?=
 =?us-ascii?Q?gEGj+9tcMLF8w07ww6CcatZqHoNK2mTAjzwa1trjwLItI7A/ferEKUxxBVA8?=
 =?us-ascii?Q?Elqz9RXe/7mX2Q7L3K4uyaor2/nz+NEkGvUKZGZtHbw9457cROqL3qs4Tm5g?=
 =?us-ascii?Q?PKJsNFIRQtrUpkWEMSq8QhECtupEtxsoKpgju98ji04fU6ZdPkJ0c8dMq3R0?=
 =?us-ascii?Q?u68O4vsTg75glLRDp8pbbqqS9C5NRV9Mqcyr/7LdEDSn9zP0FmA157tCtD7W?=
 =?us-ascii?Q?QLPdxXtyMjNg90/M0JGMIk4B3FDtNN+V6i+SP1dfKlDworxyilWzRWX9wmfE?=
 =?us-ascii?Q?uQrrYGgDxfnBnibm7nrl5AZurp8VmhEdW2oJg8PKUzU5Hpe0BcOLi8bReUhO?=
 =?us-ascii?Q?VNwxm9UfO3I9Q+Rfo0sdR9Pac3xzpAMRlBmkBaOpdWtYmjBGV75iKQHmHTb1?=
 =?us-ascii?Q?2HeEM36wsI6a/Q68f20FStzVOWOps87Ej/Q277mRSZ2vlAbOyVgxsRMI3+MN?=
 =?us-ascii?Q?JaNoRduTgSHbRIrueJnKzkzNZSjcjA8EuzPanACy5fUTCR0vvZTqxXSfzINn?=
 =?us-ascii?Q?D8QO574oQUeoQ1mdxf5lWeuCFYExJPmQHUmt1APdSLdN4CMNu8H55x2+VdaX?=
 =?us-ascii?Q?grxP5zFs6D+jroPvVe8XDcXNMOonRPeVM3A4CBBRRY0+5+MFT5WzPEWrK7j+?=
 =?us-ascii?Q?msx324x/a/Ri/PbWuZ4/8FrhWs6cpdXvMJ6LRPrUWksB4gDvjsgMtEWNQZKP?=
 =?us-ascii?Q?xevsevaBjlnEqGecOizHH5Ev1eh3isZKhpdAUdoUmTyhCpT+9eFaRKEcT0P/?=
 =?us-ascii?Q?Q1Ua/uM9SvWzlta11DANZp78LcwVom7dokEnVeUXGsf5BIWmUPz1nXySI/AO?=
 =?us-ascii?Q?nhP/KPcwbmgmYw0wEP5eBzyttZ2S1Y+t4pGd1nwXAqvbnjSH/hT5gfo/efm6?=
 =?us-ascii?Q?swLum0wuIUIuAWqsSps/kOK/urSS3a98ukcZqE51?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jxlkgqi3MICfgI3Lm5ftUxJr5DW+LBDRsFWMW4TRW0HnQozqnaDrskHxracn37vddBJLSnz1+6xIAPzRWFqDfHkN4qFxZLD9eEn8qUlMmQlso38LbEeOdxePZ/s2BlJgjOprMsV5oUIesmuRX1+TH63uTY30Rj+xJQ+tW1JSDa5H+Eo64T/nhD5aB51/MCWExCXeVtbHoDRdPX5jyjJIHc1UUej/WQMs2CX/bdcEJIdyhG1/xgDixweveiClvC3FekhCldAKW33m25nH7w9cTIX4XmNUxy9icHjtQJOgZD5di8cwmR0LbdkkYmt/fC/nJ8gIvdPlr1R4g2HlbIypdZkl2HdooY33EZc/LhxiTcVxm95yYKu4mE6ZBq86IULEUUbfxhWzNv1eKgvVamZgTlCBaiPvB9kEyrMyclUuhQ5QDSD3NgnbVphWr0OBUBPU+JhjE3LzU/RUQ4X4jmD5PJ7fXq3O6xf4J8cr1lzmwZ3tcHTw6/clOQSntK7qDGKHnBmH8hct19kBsC0EzOSw9BSjYz93HmaxojGX2O5+la7hMKlGmWPURMMJIcHtzl4iAmZ6uAjkBonaiVMwmwM5x1PGsfWXqnpdQOivT/zU3kg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef5bcd2-d4a9-4802-004b-08ddba58839d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 17:39:08.6105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jFtpgV2fM54lOH7atCAPRgLhYNWZo4GzsvC5YwCyeBNYo9E6n9SEU62rh5nQwS3VpkHm1VwJw7hLJTbaITrKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6401
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030146
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE0NiBTYWx0ZWRfXwr2crJIsPlZ7 RqDyhZqvyEvfTXp5ajsvC9chs71+Q6WcuaQ1/HeWwHXsG7JHBSCNDYlF0k8cwXKfPvBYVRqEdGr llHCoeXCTALpBZRw97AaCgcamhIext3baM2z31Pk581x8oYbByEaIArvcXstDwYva5DWrIWnYOM
 0p6NMMo66wpeLH/Pd6M/5cnWqQYtFF6z6mrt701NLc43hUdOFtiwo1vcFglrToJGh3T2NdupEkA Iu806eeBMebcQIuh5CgTIiUHPV//DTB4yew5LflY4WZ2fcDkvon1jWgdeGhviQumuM6UIdCOXDo r6FD3ipFtLnjlptE9GmF+6u6FARNhbsziY0k3Tjpnmx7CPl2XstBsBiTkipCJd1X/dBn18+viHG
 3Km+VDoK4LXPcs5uPJ23WyQNcVqerfUedtWvsXdCYjnz+c+wQXmPmVXBKJXYLumd5KLlckJx
X-Proofpoint-ORIG-GUID: U_2e5jxB43k41JVjqMa8KTYcSxyN-cEy
X-Proofpoint-GUID: U_2e5jxB43k41JVjqMa8KTYcSxyN-cEy
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=6866c042 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=qPYA9NVgxAIY-UDeW4cA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12058

* Peter Xu <peterx@redhat.com> [250703 11:24]:
> On Wed, Jul 02, 2025 at 10:00:51PM -0400, Liam R. Howlett wrote:
> > * Peter Xu <peterx@redhat.com> [250702 17:36]:
> > > On Wed, Jul 02, 2025 at 05:24:02PM -0400, Liam R. Howlett wrote:
> > > > That's because the entry point is from a function pointer, so [3] won't
> > > > help at all.
> > > > 
> > > > It is recreating the situation that existed for the vma through the
> > > > vm_ops in mmap, but for uffd.  And at a lower level (page tables).  I do not
> > > > want to relive that experience.
> > > > 
> > > > We are not doing this.  It is for the benefit of everyone that we are
> > > > not doing this.
> > > 
> > > Is the vma issue about "allowing vma->vm_flags to be modified anywhere"
> > > issue?  Or is there a pointer to the issue being discussed if not?
> > 
> > The issue is passing pointers of structs that are protected by locks or
> > ref counters into modules to do what they please.
> > 
> > vma->vm_flags was an example of where we learned how wrong this can go.
> > 
> > There is also the concern of the state of the folio on return from the
> > callback.  The error handling gets messy quick.
> > 
> > Now, imagine we have something that gets a folio, but then we find a
> > solution for contention of a lock or ref count (whatever is next), but
> > it doesn't work because the mm code has been bleeding into random
> > modules and we have no clue what that module is supposed to be doing, or
> > we can't make the necessary change because this module will break
> > userspace, or cause a performance decrease, or any other random thing
> > that we cannot work around without rewriting (probably suboptimally)
> > something we don't maintain.
> > 
> > Again, these are examples of how this can go bad but not an exhaustive
> > list by any means.
> > 
> > So the issue is with allowing modules to play with the folio and page
> > tables on their own.
> 
> I understand the concern, however IMHO that's really why mm can be hard and
> important at the same time..

I'm glad you understand, but I think you do not understand the severity
of the concern and the repercussions.

These patches, as they exist today, are not going to be accepted.

I am not okay with it going in, and I don't see many saying differently.

I am not okay with you pushing for it any longer.

Several people have told you it is not a good idea, the people who have
to deal with the fallout of this when it goes bad - and it _will_ go
bad.

You have been given ample reasons why, technical reasons as well as real
examples of failures - and security bugs - that have resulted from the
exact same pattern in the exact same structure where you are reproducing
the patter.

Please stop trying to push this plan.  It is a waste of time and energy.

We need a new plan.

> 
> We definitely have driver code manipulating pgtables.  We also have folios
> or pages that can be directly accessible from drivers.
> 
> After all mm is the core function provider for those and there needs to be
> some API accessing them from outside.

But that's not what you are doing, you are handing out pointers and
expecting the modules to do the core function.

And the core function that was suggested in the example user already had
a ref counting issue.  Bugs happen, but that sort of thing is going to
be difficult to find and it won't be the driver author hunting it down,
potentially under an embargo.  And good luck validating what was done on
return from the module.

> 
> I agree some protection would be nice, like what Suren did with the
> vm_flags using __private, even though it's unfortunate it only works with
> sparse not a warn/error when compiling, as vm_flags is not a pointer.
> OTOH, forbid exposing anything might be an overkill, IMHO.  It stops mm
> from growing in healthy ways.

This isn't healthy, it is repeating the errors of the past and expecting
a different result.

This isn't about balance or forbidding any exposure, it's about finding
a less bug-prone way of getting your feature to work.

I'm not saying it's wrong TO do this. I'm saying these patches are the
wrong way OF doing this - from experience of dealing with the same
pattern.

Anyways, I am not spending more time fighting about this.  Let me know
when you come up with an alternative approach.

Regards,
Liam

