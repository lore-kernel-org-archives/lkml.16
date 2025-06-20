Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D3D2D3214
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433624; cv=fail; b=iVofp5deiVdwDuoKeQoOCp5rn8SG9KwGQdLKIbhGEVNXysDTPpXZk3Nyu+ajKQyomCynfg5qZWwfIILnaneas/d3kFpEl8ZfbuXyIXmmm4srE5bMCPjOrBtViFVvN9/QJ8W2uW3mLrXaiQVhfxeAdl06dVVKVkwBEndYbrQFH5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433624; c=relaxed/simple;
	bh=YPYkK69GOH0EEzPGtf4NEcmKrJU3R6v0T7mNChOPi8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KGi+Gqb8BEUJ4X6PIvmwP8fi+lSRbPsxrGwCdKM6jVoZo0qh6RFwXy/WStktYzuuZVFg1NEAvboNQoL5Xm6hSKC3bDCVyxgQJBmcidWGYf3XbCL+u6dxdHSjdS6onKkjXEpPmhw45U7q5IblWZsRiKa8nLH/LE01At7D6yjNHY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kZo/K+wa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Uh0f6qY8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kZo/K+wa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Uh0f6qY8"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBlG7010437;
	Fri, 20 Jun 2025 15:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eLuqQonUKpGmuKeTmSFJln52A4i21YOMAirQvd5sOLc=; b=
	kZo/K+wax2vEdOciAkqmiZcHP8xYk1l3cdrirSBrdKmi2tqboVvXDzWtFUq9wZoI
	0sETkksh3iu1nXZ/ap7M2kfEAazKu/QdrNI4dHyprGi9qteNnYUE/qAo3qO9a469
	1BUjtVeSTD+uuLed3lcI/eF1yKm7/nta935G8O3TkQLm1o5Z5yQOGnVVJOJ2+rxC
	khDlSQQxkREOh7eeq/lUkIglkEg4hqC5l1bAIvQHo1OEcC0C3WTfNcBfcQm4sZmy
	hQ5PjP9uX2LonlStYXh5/8iXKVwUL1t9UQ4Pn3tPZ2AFou7BFI99Kh8HQ4sMJJ1f
	fyFZ/Ye4/P8gVQBv5unYBg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4uycb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEotat038292;
	Fri, 20 Jun 2025 15:33:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhd22xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:33:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9pazpSwt8TmcuvEWrZEpkcbbmgoqR/2MHjgZTa+ztKuKyipFDN7vk+dUZxT/kCtokFYbGPuMyqnHv51/Fm20Dm31gXYwc4tXbYh4bJpfTDFhTzqvYz5NQq99YTajglu4K4PSZM5NcHLhwadCXcoDHsgdfDVFqHjT4ork5/toTVLbFK121/keKj2oePH0uR9xIy+YBqdDDlJ6YYAbOK6tjFz+EgoVNEZACp206gmsTTkIe3pi2q7WnKr9oEd1ZAXW4tGIzFdKdCg5hObM8VnblYf4vkWNXRsK3AWQOiwWq6DOZqMiZHk03FYoUfE7r0SRsUcCXsT6HzaQhdC4t/prw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLuqQonUKpGmuKeTmSFJln52A4i21YOMAirQvd5sOLc=;
 b=YRtwSPGb3+v/3kl1nj/5End7FB5v+F/qAHYI94jG/p25ll+NZeSejCp9Ciyeze1N2ziL8LU2Xwvp14hPDBBhjZ5RZB8+8lCzk67GyX1TmzW6c12PUrlHB6mzAJ9aK1ZjG62kD32sesHRtAoCI4m1QLoN1RUJ+cnXWVF+VX6QcCH2kMMj+s3JNeuGhq+v7SqjpVSvRRBYhN1DoRrT5Fs53SdMFYMY8xGavs3FFtRX/qn+ZMBsIxJll3e3yHQPGLWgJJi5na8cP3YqxdPd6/nPL+9EaxBWniQRreETkj/Ci938bL2nMvQtWZLLtuqFe+dUB5IfAEUQ7LTKDb2p7IdyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLuqQonUKpGmuKeTmSFJln52A4i21YOMAirQvd5sOLc=;
 b=Uh0f6qY8d0roXg3lpADaedCvnVCH0h8+Y+jhNxw1u2cM8r46b8JwLhzMpL2o6ElGfu+lbLX5bq6Jjq48fnyWEMB55+P0YCZIh53Y0h2APsgd6DPX7jHToeLB4EnSgP7/bEQ6FXPXF1B1Uw0aQxs1MNJ73p2OMKoYYDLH1SB1RTU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN4PR10MB5591.namprd10.prod.outlook.com (2603:10b6:806:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 20 Jun
 2025 15:33:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 15:33:13 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH v2 2/5] mm/madvise: thread mm_struct through madvise_behavior
Date: Fri, 20 Jun 2025 16:33:02 +0100
Message-ID: <a47d850b0111735e026d438c3300c0e3b7f439f4.1750433500.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0184.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN4PR10MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: e0beb6ae-5499-4bc1-84d9-08ddb00fc504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qv+ddYPn7a+cjGDv3nj34fUmszvkxEJk1wpUFBw8M8IEIovlwqQMo3IkSPbG?=
 =?us-ascii?Q?2xvQPzbdbhygO3FmbnKF0ITUoHJX5V/f9kkuzTZNu/1PCRew8WfOchRHCTAZ?=
 =?us-ascii?Q?mPc4ulYO0IOTettzq/i/6Yij7bAc73QgtlptWnMXe9B16fsQOrNpvMuZdKQy?=
 =?us-ascii?Q?o8YsyRUqNSKu8du0VNL7xPbx4ScPNtxRiG2CPeuaaygpPwX6zPtLgmbhP1sY?=
 =?us-ascii?Q?aEuQcacn26xBXump69nTjvtL4d+vp653RHCiQQ197foe6BltsVXlkuknV1d+?=
 =?us-ascii?Q?6ix2wI4v3fNITrhyNfbd+p4NM0cMntWv/TUiI8AalioOmSCpOBsm/jyVHgdF?=
 =?us-ascii?Q?x6cuSTMGzTSdfwGpNUELtnM9Hd8P1HcZKxp7qh6tbASEkhfzU7p4kcEXGbCn?=
 =?us-ascii?Q?tuP7MUHI22KKXcGqVn4w5q8BZYWNC4TuH21GfYbSAeg6x9nXoWwxpIGrQIQd?=
 =?us-ascii?Q?2YcMZGpUi8cM1tWggg0lgFP83nihYIuJd3cGzsi5tfwpsFssZDC8uRnsbuIY?=
 =?us-ascii?Q?LAF8smsn+nZZUkbuIHNh9piMyanAOpQNAfnVfZnN4hFDxdjGUlgWnzbFHf4Y?=
 =?us-ascii?Q?MNGomBjCh0i53LZx4dFx10Ym99EhAXfgYVYhfkm6pWizQtj24jaHHwrUinHO?=
 =?us-ascii?Q?cOqJBkucM3PLRYOFv5XkuwsiCkypBSZs4BlK9il8p4zv6OJ9Y4T6mhhJQHVm?=
 =?us-ascii?Q?bltFFvBU7dV0BuMJwS5amX0DCCJJBo4BVEiPXHcNmvfoID3gLhx+sV1E7Lsb?=
 =?us-ascii?Q?Ku2zPOGU4S+TDb6Rje+eZG77By6w6A5r2L7mqliCdgM4zMApbhd4LC5XQUHl?=
 =?us-ascii?Q?j4z7XmGQBUtnJGSJrNdyRwaFMaAykwkJQ1j8j9xK8Zg6YdMNuwOSXvNBTZsc?=
 =?us-ascii?Q?RegFcHoSGF+jUXvJXhYWBikKdTmyqkYmE/evQoiqX4gciBujj1is4CIQb7nk?=
 =?us-ascii?Q?7eRT4/qhzhd6ec4USDPitmeJDC3vde+GfCvLEmfP9hm+CKWyjWCdAckfcP9x?=
 =?us-ascii?Q?27ygzdi56Wn9d4iZnkiHnLVqHAwaeyBcjg5vUuqQFSAYJ8rKWrxVmU/QSGD1?=
 =?us-ascii?Q?9CzyO2vcVqbQO4KnUxLjyS+PgWOaN/rvJZKJ73vyyEdu0nbUvBlsfOjvpOXC?=
 =?us-ascii?Q?WYdiN6WdDc6ytRAsf0dQUp1+hwdhah2ttS14iZF46xqEM0hisbG+zA+xwHSp?=
 =?us-ascii?Q?a924U8DRgoMZ53LH6Sg+lqttjdwd8ogPXkMJ1wIxGIZYxBXI5Oae2BJW2XTr?=
 =?us-ascii?Q?Ac5fpUXqZjA4H5Ky3NkbSrJarA7QtcSjF/xcHt+4J725ucGaycAG6fyjms2f?=
 =?us-ascii?Q?uH1IJel6Po8A/l3ASCQN/VN8xdhv2S1a+NqqrxcgLIz+Tj+enuvxdHB7PVMv?=
 =?us-ascii?Q?YrzeB/XjsSIFMXvGHwHIgngq2++M9xUUF3B8lWNpylYjV5tfr3tCX7d4WwTp?=
 =?us-ascii?Q?gdNHAR7yUi8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tfzAuhVVYFAsQ6hluNLeNbeI4fwmmf6o3TFXEjT3nqZqV4z2dAeywBSdaVlZ?=
 =?us-ascii?Q?7Km6XsOqH5/cqPZCQ1hfB48zvHMa/2Ie77nNus1hpwCwm0dVH47CaW+HGrfR?=
 =?us-ascii?Q?LwHtf09kyRyDLc3iWuNnNpsPy2TV5jkMwouNktu5tfSLuNhC0K4UTbi/jqho?=
 =?us-ascii?Q?4UrCQ0u9mbu6/TX4ZR2FT/8gkfidpsn7RQF1Ob/yXJbvMPW0UsofRZiTJoPv?=
 =?us-ascii?Q?kpd5GJHilFCyvI+fkzY2qo3oZvuh0bgspRlXZyhfYhyXnHdgIYhTEdhWk+xO?=
 =?us-ascii?Q?8NP7WyTtEoa6vVkKauXtkpFFIvu+BW3Jarx/ZYbcEYXiK7Xg1LTlaGKzuEuu?=
 =?us-ascii?Q?Ij+F0e6+l5pK7ANMMxXLVb//yuw6o0Ll2sJBRBQ4irJ1meFy+Bpq8C756Qtt?=
 =?us-ascii?Q?4NCCkpcJvnolV5xoqYtUWdrLdGlNxaD08U5UB6v9rzS27v7guLTjn5o76o6C?=
 =?us-ascii?Q?rA92WOF0e1urWeF4Pal8UsgeqrG9f3/88gTzyLBFI6UAK0dg7HyaWoBIEWLB?=
 =?us-ascii?Q?ddgv3cEWQJ2PL1P2Y0bdgE4cas7Mr0FX+vcQuqUY/fIxShZ19sPA7pTbO7np?=
 =?us-ascii?Q?hC2/y8fkUmDZHMrYiXFvUpX0oURn0VcfX96Q1kPPbpWD4S/g98OKj2OmglmO?=
 =?us-ascii?Q?WDlmgX63RTd7SVFp23EAAA5ms2t8Mv0CcKW76Us59zSv40B9g4Y+LVJ8XQRb?=
 =?us-ascii?Q?/43QL3FXhfVRMT6lltV1GNjWRaifobbm7E22zUWKBzON1bQB9VvaFZf/m9BF?=
 =?us-ascii?Q?P1QaQBGZTVErI+JgjRShR0uaByKnM72TbTRe+n666yYSrTXovSj6JJ7Czp+C?=
 =?us-ascii?Q?g25KoXERpYrW7MRFgb+SKI2fNphTBW13ZuWIXOPhXkAIJ//LmBziHL4dbDZH?=
 =?us-ascii?Q?VmdL8YCAzGK0wodTwOIzzcjaKIof0RDzkbByYMuGjswSPkX//epgZWs4OtUW?=
 =?us-ascii?Q?J4mtyiUIsQU3XOj7MXYd/PQ69TZnBdKsihJ+H5sUAVuin8XZW+HT4L77611I?=
 =?us-ascii?Q?neXuOtOScHBU079vWBX1VEByEAYE4u3U4JcCUOZ8C91hr+ywSpBAW8pgohna?=
 =?us-ascii?Q?eQHLppWU3BQw2bnn3yelLtEN6CO+TEXTgq7gzCNayc8uXALKdaJux8IjLvMP?=
 =?us-ascii?Q?DL31dd95Uyrk7gvwAWdHehOFZnhgMtLuKoyR4bT9Z/A7msaAOoOwi5BdlmL2?=
 =?us-ascii?Q?E1dNKH4Ju/KKYAZ8687fKz5X5qzuIWql8P2dm5WoGCoQDrZa+axBEDpXVxNN?=
 =?us-ascii?Q?Gm1CGPJ0Pry6xTnnu5IePNQwVj3eTTH0gPb+A9MQjBluC8/2+Snq+P0Mke7l?=
 =?us-ascii?Q?bMXuaU/oYqjGrPvLiTyA1n2a2H3YWdvzGoy0t7z+8ymB/tWTJul87wriaS96?=
 =?us-ascii?Q?Zlz0wC+h6OA0jRxCwkVPJvpWW94et77mhICnI28Yw7a9M4pzuDpN3G2/a95b?=
 =?us-ascii?Q?xTgo6TEbmL6cvcpnChj01/NtFkC6Z3dIdH5/c+hDl6jZiK4xG0i/Otxr4rEq?=
 =?us-ascii?Q?ce0dj8M1Pb9LrsloOdwQHfMtjDcgeJ2DIvq4ybCi6c1KZZqmW1ShoXmnNXYu?=
 =?us-ascii?Q?dn0qM0/Q9kL1d04sTQzIURsrc9zGVVCtR57t/9KIwqdPR4cDn9PyAeP+Dr4f?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/en0keAVy3eUIOWigFZOfji37YJDnPFtgKbxLFV8aYsDRtpOftEgsHGTEJ2ILSZbYAP01sf0iXB9kNeKzZzWyoTVOzdxteB+Ovj7U6eawPhrqypPXMODikEvWbOYJu7gNz3+ZqF1+nnG+qjqHvXTVLXD4Ude+OXL3mU5cgRukONuXuIiKIhdCtR8zhb8vQRZ292KgaH68xfI+ScFKZZE5191NPurY1rJHBNwPk8np64dmkckF/UkVAPJuQzkGfCFedat5mIi/SMZAcQhb4eT1Y+n5bvBwb0cncvII+XVPKJk+xJLIqtOwqoWqYqq627DwovtkKuH3XYiJMbegm4RSmr+vWl2Ghzn952U6qQMlHlTlv5QXKjNbVtxPlMWFCDrocpDu099Vv+A99Y0guCjd2q1jqpsTKB5hi8sriPks7QRzE/MR0cvmimSiB+8XZt9bJP5t/ajrLqcn7ftxbpcmuHI1BPdtlyCXB8EUe07DpSOC0oOMQRF0PKfYCyc9avYxAP4IkieqEByXKeOnKf0CK61/Dt874w+3gD6xHLHlHBvl41hnDZOeF7ErOkMGSP4XvcrUIV/YJOjU5QNiWgZRtFDqcsx37qUzzS7nxzz8FE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0beb6ae-5499-4bc1-84d9-08ddb00fc504
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:33:13.4574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YRtUzaQEbhWDZnrcRZ4DAlHgdqQ8jOGrJJZzCBqmnZqoqrF0wnAKo4ToQaR7NyEPHNHCR5nr/b6ClQKq+SIAWt22gu2YN3+tI7SqSCjVY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5591
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMCBTYWx0ZWRfX6Rassi3U0TAA b5cWQ3loYwtOZTLRnkiaENIrvCc+a7I2fVHXe+HpvHZVWfaDy9Y8vaGCYftPl/fqmhiu5aP1lKD kqhLM032GQgzJ6wVMBCM/1Pz+EZe9tXUViuKV1mSyIKDSH+rbQPIHYsGT5YxXTbP5IovE81ESbl
 3hOEHLfjBua/brs/z34l/iT6+ePJf2QL1TYJTVyt+8v7CvCZZjve7CuHnXmjb9ObeihkQ5XDuVP RawYNFOac2lDha9LBwnvMfjEwBv9hguwbgspN1q9pUCqF2mLJyzP4ByfuoXp2jmUnQDU+UIBmyx DRcxWOazJ1+IYA7pTo8GkjwFHzL82DUJcpN6lTE73D9IdmxYarG4oE6CU/ihqnOGdDHBF8at8Wc
 37B/vYkJgSkQCDVeJIGKf+oZzurZVPwpsB10SGGFeptNmVPSqqSifGzjIkNAj5s+CcKvyAMU
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=68557f3e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=_XDJ28uIXtxIByfxrr4A:9 cc=ntf awl=host:13206
X-Proofpoint-GUID: PSJF90d2yTPbJjYd9CN05FFj_o2WeXJF
X-Proofpoint-ORIG-GUID: PSJF90d2yTPbJjYd9CN05FFj_o2WeXJF

There's no need to thread a pointer to the mm_struct nor have different
functions signatures for each behaviour, instead store state in the struct
madvise_behavior object consistently and use it for all madvise() actions.

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 110 ++++++++++++++++++++++++++-------------------------
 1 file changed, 57 insertions(+), 53 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 93837b980cc2..f1109c2c63a4 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -58,6 +58,7 @@ enum madvise_lock_mode {
 };
 
 struct madvise_behavior {
+	struct mm_struct *mm;
 	int behavior;
 	struct mmu_gather *tlb;
 	enum madvise_lock_mode lock_mode;
@@ -65,8 +66,8 @@ struct madvise_behavior {
 };
 
 #ifdef CONFIG_ANON_VMA_NAME
-static int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
-		unsigned long end, struct madvise_behavior *madv_behavior);
+static int madvise_walk_vmas(unsigned long start, unsigned long end,
+		struct madvise_behavior *madv_behavior);
 
 struct anon_vma_name *anon_vma_name_alloc(const char *name)
 {
@@ -125,6 +126,7 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 	unsigned long end;
 	unsigned long len;
 	struct madvise_behavior madv_behavior = {
+		.mm = mm,
 		.behavior = __MADV_SET_ANON_VMA_NAME,
 		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
 		.anon_name = anon_name,
@@ -145,7 +147,7 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 	if (end == start)
 		return 0;
 
-	return madvise_walk_vmas(mm, start, end, &madv_behavior);
+	return madvise_walk_vmas(start, end, &madv_behavior);
 }
 #else /* CONFIG_ANON_VMA_NAME */
 static int replace_anon_vma_name(struct vm_area_struct *vma,
@@ -991,10 +993,11 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 		return -EINVAL;
 }
 
-static long madvise_populate(struct mm_struct *mm, unsigned long start,
-		unsigned long end, int behavior)
+static long madvise_populate(unsigned long start, unsigned long end,
+		struct madvise_behavior *madv_behavior)
 {
-	const bool write = behavior == MADV_POPULATE_WRITE;
+	struct mm_struct *mm = madv_behavior->mm;
+	const bool write = madv_behavior->behavior == MADV_POPULATE_WRITE;
 	int locked = 1;
 	long pages;
 
@@ -1408,15 +1411,14 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 /*
  * Error injection support for memory error handling.
  */
-static int madvise_inject_error(int behavior,
-		unsigned long start, unsigned long end)
+static int madvise_inject_error(unsigned long start, unsigned long end,
+		struct madvise_behavior *madv_behavior)
 {
 	unsigned long size;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-
 	for (; start < end; start += size) {
 		unsigned long pfn;
 		struct page *page;
@@ -1434,7 +1436,7 @@ static int madvise_inject_error(int behavior,
 		 */
 		size = page_size(compound_head(page));
 
-		if (behavior == MADV_SOFT_OFFLINE) {
+		if (madv_behavior->behavior == MADV_SOFT_OFFLINE) {
 			pr_info("Soft offlining pfn %#lx at process virtual address %#lx\n",
 				 pfn, start);
 			ret = soft_offline_page(pfn, MF_COUNT_INCREASED);
@@ -1453,9 +1455,9 @@ static int madvise_inject_error(int behavior,
 	return 0;
 }
 
-static bool is_memory_failure(int behavior)
+static bool is_memory_failure(struct madvise_behavior *madv_behavior)
 {
-	switch (behavior) {
+	switch (madv_behavior->behavior) {
 	case MADV_HWPOISON:
 	case MADV_SOFT_OFFLINE:
 		return true;
@@ -1466,13 +1468,13 @@ static bool is_memory_failure(int behavior)
 
 #else
 
-static int madvise_inject_error(int behavior,
-		unsigned long start, unsigned long end)
+static int madvise_inject_error(unsigned long start, unsigned long end,
+		struct madvise_behavior *madv_behavior)
 {
 	return 0;
 }
 
-static bool is_memory_failure(int behavior)
+static bool is_memory_failure(struct madvise_behavior *madv_behavior)
 {
 	return false;
 }
@@ -1549,10 +1551,11 @@ static bool process_madvise_remote_valid(int behavior)
  * If a VMA read lock could not be acquired, we return NULL and expect caller to
  * fallback to mmap lock behaviour.
  */
-static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
+static struct vm_area_struct *try_vma_read_lock(
 		struct madvise_behavior *madv_behavior,
 		unsigned long start, unsigned long end)
 {
+	struct mm_struct *mm = madv_behavior->mm;
 	struct vm_area_struct *vma;
 
 	vma = lock_vma_under_rcu(mm, start);
@@ -1585,9 +1588,10 @@ static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
  * reading or writing.
  */
 static
-int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
-		      unsigned long end, struct madvise_behavior *madv_behavior)
+int madvise_walk_vmas(unsigned long start, unsigned long end,
+		      struct madvise_behavior *madv_behavior)
 {
+	struct mm_struct *mm = madv_behavior->mm;
 	struct vm_area_struct *vma;
 	struct vm_area_struct *prev;
 	unsigned long tmp;
@@ -1599,7 +1603,7 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 	 * tentatively, avoiding walking VMAs.
 	 */
 	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
-		vma = try_vma_read_lock(mm, madv_behavior, start, end);
+		vma = try_vma_read_lock(madv_behavior, start, end);
 		if (vma) {
 			prev = vma;
 			error = madvise_vma_behavior(vma, &prev, start, end,
@@ -1662,12 +1666,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
  */
 static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavior)
 {
-	int behavior = madv_behavior->behavior;
-
-	if (is_memory_failure(behavior))
+	if (is_memory_failure(madv_behavior))
 		return MADVISE_NO_LOCK;
 
-	switch (behavior) {
+	switch (madv_behavior->behavior) {
 	case MADV_REMOVE:
 	case MADV_WILLNEED:
 	case MADV_COLD:
@@ -1687,9 +1689,9 @@ static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavi
 	}
 }
 
-static int madvise_lock(struct mm_struct *mm,
-		struct madvise_behavior *madv_behavior)
+static int madvise_lock(struct madvise_behavior *madv_behavior)
 {
+	struct mm_struct *mm = madv_behavior->mm;
 	enum madvise_lock_mode lock_mode = get_lock_mode(madv_behavior);
 
 	switch (lock_mode) {
@@ -1711,9 +1713,10 @@ static int madvise_lock(struct mm_struct *mm,
 	return 0;
 }
 
-static void madvise_unlock(struct mm_struct *mm,
-		struct madvise_behavior *madv_behavior)
+static void madvise_unlock(struct madvise_behavior *madv_behavior)
 {
+	struct mm_struct *mm = madv_behavior->mm;
+
 	switch (madv_behavior->lock_mode) {
 	case  MADVISE_NO_LOCK:
 		return;
@@ -1743,11 +1746,10 @@ static bool madvise_batch_tlb_flush(int behavior)
 	}
 }
 
-static void madvise_init_tlb(struct madvise_behavior *madv_behavior,
-		struct mm_struct *mm)
+static void madvise_init_tlb(struct madvise_behavior *madv_behavior)
 {
 	if (madvise_batch_tlb_flush(madv_behavior->behavior))
-		tlb_gather_mmu(madv_behavior->tlb, mm);
+		tlb_gather_mmu(madv_behavior->tlb, madv_behavior->mm);
 }
 
 static void madvise_finish_tlb(struct madvise_behavior *madv_behavior)
@@ -1802,9 +1804,9 @@ static bool madvise_should_skip(unsigned long start, size_t len_in,
 	return false;
 }
 
-static bool is_madvise_populate(int behavior)
+static bool is_madvise_populate(struct madvise_behavior *madv_behavior)
 {
-	switch (behavior) {
+	switch (madv_behavior->behavior) {
 	case MADV_POPULATE_READ:
 	case MADV_POPULATE_WRITE:
 		return true;
@@ -1828,25 +1830,26 @@ static inline unsigned long get_untagged_addr(struct mm_struct *mm,
 				   untagged_addr_remote(mm, start);
 }
 
-static int madvise_do_behavior(struct mm_struct *mm,
-		unsigned long start, size_t len_in,
+static int madvise_do_behavior(unsigned long start, size_t len_in,
 		struct madvise_behavior *madv_behavior)
 {
-	int behavior = madv_behavior->behavior;
 	struct blk_plug plug;
 	unsigned long end;
 	int error;
 
-	if (is_memory_failure(behavior))
-		return madvise_inject_error(behavior, start, start + len_in);
-	start = get_untagged_addr(mm, start);
+	if (is_memory_failure(madv_behavior)) {
+		end = start + len_in;
+		return madvise_inject_error(start, end, madv_behavior);
+	}
+
+	start = get_untagged_addr(madv_behavior->mm, start);
 	end = start + PAGE_ALIGN(len_in);
 
 	blk_start_plug(&plug);
-	if (is_madvise_populate(behavior))
-		error = madvise_populate(mm, start, end, behavior);
+	if (is_madvise_populate(madv_behavior))
+		error = madvise_populate(start, end, madv_behavior);
 	else
-		error = madvise_walk_vmas(mm, start, end, madv_behavior);
+		error = madvise_walk_vmas(start, end, madv_behavior);
 	blk_finish_plug(&plug);
 	return error;
 }
@@ -1928,19 +1931,20 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 	int error;
 	struct mmu_gather tlb;
 	struct madvise_behavior madv_behavior = {
+		.mm = mm,
 		.behavior = behavior,
 		.tlb = &tlb,
 	};
 
 	if (madvise_should_skip(start, len_in, behavior, &error))
 		return error;
-	error = madvise_lock(mm, &madv_behavior);
+	error = madvise_lock(&madv_behavior);
 	if (error)
 		return error;
-	madvise_init_tlb(&madv_behavior, mm);
-	error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
+	madvise_init_tlb(&madv_behavior);
+	error = madvise_do_behavior(start, len_in, &madv_behavior);
 	madvise_finish_tlb(&madv_behavior);
-	madvise_unlock(mm, &madv_behavior);
+	madvise_unlock(&madv_behavior);
 
 	return error;
 }
@@ -1958,16 +1962,17 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 	size_t total_len;
 	struct mmu_gather tlb;
 	struct madvise_behavior madv_behavior = {
+		.mm = mm,
 		.behavior = behavior,
 		.tlb = &tlb,
 	};
 
 	total_len = iov_iter_count(iter);
 
-	ret = madvise_lock(mm, &madv_behavior);
+	ret = madvise_lock(&madv_behavior);
 	if (ret)
 		return ret;
-	madvise_init_tlb(&madv_behavior, mm);
+	madvise_init_tlb(&madv_behavior);
 
 	while (iov_iter_count(iter)) {
 		unsigned long start = (unsigned long)iter_iov_addr(iter);
@@ -1977,8 +1982,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		if (madvise_should_skip(start, len_in, behavior, &error))
 			ret = error;
 		else
-			ret = madvise_do_behavior(mm, start, len_in,
-					&madv_behavior);
+			ret = madvise_do_behavior(start, len_in, &madv_behavior);
 		/*
 		 * An madvise operation is attempting to restart the syscall,
 		 * but we cannot proceed as it would not be correct to repeat
@@ -1997,11 +2001,11 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 
 			/* Drop and reacquire lock to unwind race. */
 			madvise_finish_tlb(&madv_behavior);
-			madvise_unlock(mm, &madv_behavior);
-			ret = madvise_lock(mm, &madv_behavior);
+			madvise_unlock(&madv_behavior);
+			ret = madvise_lock(&madv_behavior);
 			if (ret)
 				goto out;
-			madvise_init_tlb(&madv_behavior, mm);
+			madvise_init_tlb(&madv_behavior);
 			continue;
 		}
 		if (ret < 0)
@@ -2009,7 +2013,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		iov_iter_advance(iter, iter_iov_len(iter));
 	}
 	madvise_finish_tlb(&madv_behavior);
-	madvise_unlock(mm, &madv_behavior);
+	madvise_unlock(&madv_behavior);
 
 out:
 	ret = (total_len - iov_iter_count(iter)) ? : ret;
-- 
2.49.0

