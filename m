Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40098BF8;
	Wed,  7 May 2025 22:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746657261; cv=fail; b=gdY9MSCjsXyLTgrZ+Q7/2zWHC+V85iZYwQ+6s605hozMjcsqCq4/rvdQcJUiYEA48JHMKzoZhlWuyHZBwI3s7/kSCYaxT1cK7K3SHGpde9Nnyrecj41BJIcuqYQfue9z+q8P7ymM/djZ81bH4e1L/bjnJIf2JtFXBspyqgqynhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746657261; c=relaxed/simple;
	bh=HylNvj6f91SIpc8m62ihtpLVPkiPNueWYBFkPs0GGBs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OWPoHAlCg5TEMQnyVovvXmtV7gjMn0numbG2fNe58aXyBT3zcraVzW4qvu3mxDVfnzl8ZU8lmuq+eUGRE7bCPd51KHdd3boBIl4hLIWGNugdksGosv8u5mQOuzSHI/crMHcBaHhbA5oX3y/QaIu2hW2xxeb/YiKfH7eWHEc4Ap8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ipnfaHKB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=irXKAzqA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ipnfaHKB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="irXKAzqA"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547MMIwj013322;
	Wed, 7 May 2025 22:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=FuDJ1rm6sKYNRSlT
	QV6I6Ql3cgeJB8Z8bsMvXrEjTHU=; b=ipnfaHKBl33oDjavcbRg6G7yk4SpKvDT
	LU/VtAI0p1npg4VrEdd8kg83Xnd881pDquVq+X0l0NV/1zESRyuJYT/Mdt0Kh/Be
	wPGTh2JNTX9hLqQT7mQtSTNDenEuA0tgkB394SOCd60pOotzMuBnftGm6oXX7ySC
	BDVIcHsNJz1jUhobvA7HNECYnNB/nXbcILYxOLEeQNL+7ze0GEQALZSu2iENMqKb
	QTMfkHVS/zPKbLOcj0kaeV0Y4wYQkuJAGM+drZCh3PIl4AQLm5wJTauwZVntwQym
	PK5D5B5oZ6FWGBMkOYppuIGRSsNQFBmXX627sP5QZPfj4U/k37Lrkw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46gg8e80fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 22:34:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 547KFFiE037590;
	Wed, 7 May 2025 22:34:11 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010006.outbound.protection.outlook.com [40.93.20.6])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kar2we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 22:34:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ0lmeeiFmIg1qUCYX3AsQXby1G8UNZ7/YZxtV2r2Dzb9k+mrpsSCejgUdZeOOnADilifzMxBaMnQ9iwtGfC7cHkfzhIelDOPDfPpRPoZxsjWf7bU/m5+i3rCPLBm6Fejdu6yiXY/N4WNkMYC4TSSgJmM51r9JrnR8rr0dM3OwO3etS03Y91nZJPr53orPUGVGLxXR1oyjTGqKjJEiVX0TUe/ukHBPTxWzOFAETJbvrg9RSqk4u093IS97TYuTBPspOmBvIq1G2dxMRMOjPPCxrIkOWKIyHS8Q/oIrpMMKbI8i9Fmyr4vLOAc8ZXeGm+RntNSU+PXss2ZU7D4zH0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuDJ1rm6sKYNRSlTQV6I6Ql3cgeJB8Z8bsMvXrEjTHU=;
 b=MZQkOAo/qLMkXh10J7cKh4MtGVil6up7x3il1s4qTpQ6E6a1zVHncF6VEfL33Dkrfm1H2l1gGkS74rQKGx2y6vTVbj70PLjCZSwAEBsJRZYsoyTJNDXM0+FRTVfxed/d+2IeL0z99lDddoliPCf4GGZ6ERrUXxw4IEAtpEPKjPZLMy/TPL4WwPPnEZiqJkAKt/9xjIk2tiKhyXLXl/WFElJBIFUiIfQF7NQLhNv+f7wO1VB44pmzdZ05V8RnHyLwPLYP3GOAAJACAsveUw4XbiDbvE/Rmnp3o0HXgFfvMEFqRbypCXyjWW8ZdZU3N1CZdzAL23yxtIG79d7jfpH6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuDJ1rm6sKYNRSlTQV6I6Ql3cgeJB8Z8bsMvXrEjTHU=;
 b=irXKAzqA0aSMcq3X8EcbcBaoatK6CrKn6St1HR02RLFHh7k2cf2u5eft8z0YbBkgj+z1CgYA9z5gJ7uj+LXhQe+/Oglw6BOLAYMJPOd3frv9oUwxn2Mx7kS0kUSXLHpaOUnDSQQq9EVaZx8LotyBeHUR47nZHHRHTeYxTrY4rw0=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by CY8PR10MB6753.namprd10.prod.outlook.com (2603:10b6:930:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 22:34:05 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8699.021; Wed, 7 May 2025
 22:34:05 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org,
        linux-debuggers@vger.kernel.org, Sentaro Onizuka <sentaro@amazon.com>,
        Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [PATCH] fs: convert mount flags to enum
Date: Wed,  7 May 2025 15:34:01 -0700
Message-ID: <20250507223402.2795029-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.43.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::16) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|CY8PR10MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: a11b46b0-7827-4dbc-343e-08dd8db74603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KqrgcXf0/d3ohUrRu+hFWk8AWm1GM4Fnl9sebfHw63hcM2V2EdfxfFQg9f2l?=
 =?us-ascii?Q?/M4rcNGmZKUrMATI/9B7ZD7bQa4zUguEw3IiNOjAuYJX7BI/o7WrUG+u2Keb?=
 =?us-ascii?Q?S5nHmnf35qb1FxnAcVRv+/GiP2AOH6dNV73n5ulbSGTEuhRBvXEj0Wk3yy7B?=
 =?us-ascii?Q?AqtDKcAlreyPLNnb2N3k27VOMZYQYFzv1hDRX/uxzXGU4s/1xOiYtfls09x+?=
 =?us-ascii?Q?5dkS5kzpyhbs77oTzIxcnqLuXEr3q0D/A5VwY18Cr8cv1Rv+2oujQIR2CsYy?=
 =?us-ascii?Q?du6ulRTa9CO5Bn41z4fKp3+l8Jetro+jglSe+vZ1yOerEgPuOQz49QrrCGzG?=
 =?us-ascii?Q?9dQ/xmre6GEQhf/ApTn/GNTOfJfAzfWC41tVykj3a9VagfplfsjbYBBERRAJ?=
 =?us-ascii?Q?70eZSon9/BZJ0rhlZC8ZIIIxoygnUm5ZVzg+rrUXMv9ReK756q+/CSLY/m3R?=
 =?us-ascii?Q?Eo8iZCMBY4p23kDWiS7dn1akvS2pSOzABgxdwe0jPXb5WCZtJZz3MmZUBDKN?=
 =?us-ascii?Q?bz0re20E9neX6iu50j2ZRAM2ezHKOX+7lkxb6sokSRBk83xnRzY/BSEeQ2zY?=
 =?us-ascii?Q?FXXqp82yHdInhG39bSq2mjxenr33kQ1WYu5+43pKih/zwFsCh/TDaCAip6IZ?=
 =?us-ascii?Q?gnGFNctTgRSKZ58QpW5UZSQcNO2DeNoFl/uGExg3iuCx9ElnjTtq5hKp3YZD?=
 =?us-ascii?Q?eggbeVsT7Jz7d98iL3F33+rN7yi3PZQWkc1GQVoVgu0BxPJ8v+X7UGpGJS8/?=
 =?us-ascii?Q?QrJfjUjG6n3fOHp/cBsXs5jebD1KkwrWNXx8iJ+BSvOkfbG21yswWuiJzekb?=
 =?us-ascii?Q?d01tq4ZcEYxS7qVVxfmM/cPEuVZBzUuY+H2K+gMERATf2IvsmQjb+AXF/Fvs?=
 =?us-ascii?Q?xFsu35x/X87irr0HaFq831j9a0C0mYeUnCdt212B4lpZ0iaiVp/r0v+SmiCW?=
 =?us-ascii?Q?wOkajd4TlUWWT1ANmPgWFg5MlTV3vWZbsXFJZdRN83o713/NBZgt+VnVS4xi?=
 =?us-ascii?Q?qcWxnQaWbi99TcMMmtvngFIpLCi9WSQF1X3ZzH7GhVdWc/LgFBk3jymYwiZ5?=
 =?us-ascii?Q?8PS403rZSV4AE84KLKzeMN+cuuzpC9ykZ7CynGis53QnLDDGghYUBxVcy+o/?=
 =?us-ascii?Q?aJWKvNeuEpNmAgK0MkVht+lJlO45HXadNmsOILvfHRRtKYOm3vHZybb2CZ3+?=
 =?us-ascii?Q?EIUl6aW0Qdul0xvLzUideDGpRo84G1sbGqR7CXXZ30wZB+MjAAiSKeQCQ4r8?=
 =?us-ascii?Q?Z7bfRHRy0nr/MOEN3eHS75JW2W6P9YylLcy3wwgEOR7UGHUVfyHrDRu+dkc3?=
 =?us-ascii?Q?uDNc4GANaAnSQYIddl4hn//WpO1UgU5a/oYbiMjW3MmSnh6Ws1d8LAUeXiHn?=
 =?us-ascii?Q?Z4ft2fYUWAmEJuoiKkoYMieMQ606G2WdvEi26ViudQvNViUWOMgA/9aU146v?=
 =?us-ascii?Q?qUVfWNF1eF4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g7WLgvVAKOxLlzTRcAJFgcB+j/4mwbeiU28kDRL1Zx84fU9JyJEUkpxr75YG?=
 =?us-ascii?Q?EbJ3Oa879MGaytt0ZVI/ST88XlOFFykBXv6tQjjyNiR5KVInlLagLR0QxfWB?=
 =?us-ascii?Q?OIxJcU2S/v35F0ZbrG4pW1gc3RxV3Z/rMrJM4iHiUmnTFkYMAD02mO47j+00?=
 =?us-ascii?Q?BGEBzv/8+WXMkOETBRBPOBxrux3AecgLNdaQKoxlxuifECvF0Yw7YK6Q2S6B?=
 =?us-ascii?Q?OzXzGEHToI+2dWdC+oCBc/Cc6MHH21ioBDYSTPUOZcPvEKy99Ek4f4FvlaIc?=
 =?us-ascii?Q?pzYPOpvOZwihKnjXCzCkCtfBZiE4D5yzbesEp7sSfdRh8bQMDuNO7NjajTQ2?=
 =?us-ascii?Q?Tvj7jZ1xs1jWybUbEDKusCm7EGXvoMkphVMZZUp1fisXJcBPGRfJx69lflQm?=
 =?us-ascii?Q?Fy12qLft/WDVD9KGF6NR/SI6lEQ8vE/xTH37Nlaa43vIO7uDAFBCI/fgi+et?=
 =?us-ascii?Q?H5vPc4127qVlXUyzmlBcV8Iodmhs7+dOq74Q07j651mtGLnHXN/nc3GkVdKu?=
 =?us-ascii?Q?/ED3M8AKoaSaCRaoUMmWqAPT8II6mDeMBpvz24Je2yN+VMiSCR9/jMtinyHI?=
 =?us-ascii?Q?cO1f25azILxhEkZfNaL6TcQfHeoaPNLxbB5MvlzIw2ktRR8d4tRoqtjVeXaO?=
 =?us-ascii?Q?zwH6vUf37oTV2whs9P+mRSWNQ6syutZ4jCRgvpdCUvas3lLxuM+D2s0FnCkJ?=
 =?us-ascii?Q?yZsjFuTnewQ7ZvqoxxQ0sMPTnKMuCz7JQjbc+wnRPHcA74v/TdVNc89w9SZX?=
 =?us-ascii?Q?Cy/YTB1LJa1Z9B7vkrVeet8bWAs4Gz1j+D4ECnAsCTEpJ2y6mhCabIJ8uJqL?=
 =?us-ascii?Q?tvFvjterLfpfnkxcl0BHFKw24YXJCEt4TIVloJqtIGOO1TYTCQ+lVf9iDokZ?=
 =?us-ascii?Q?kQQTVHnaUPIUGl7joLB33J/aKkS5kYUKvyzpHEp9QztBQ10NbdJ4g+5Fc1l4?=
 =?us-ascii?Q?frGjI08Sqp3NP38u7Py6e+8TbeU2TefIlo547ic+dwPRnSMQ2E95Co/YqusJ?=
 =?us-ascii?Q?dXWNnEgz/F9o0lA4MFSNnyP4YJ1K9dLSFszEM6f2ESvpHTn4pe3c0aozcCaf?=
 =?us-ascii?Q?3MIb+BbLdrUj+6Ro5URd1yVNuworuMAFLyk3efzUVZwfqrJC1JTlmNFVnwrh?=
 =?us-ascii?Q?HubWBkujkucudkQqAy4IvDBm3uE/oTFbGEiVENB+JvhBPbhHyn7EY0rA2FBA?=
 =?us-ascii?Q?NKXFIjUswYmXuWGV//kPELATMbdoTpFjpydF4CR0y5Py/wRFvIqFZaDqOD4I?=
 =?us-ascii?Q?JhRUgaj1s0xe1Jjney8kXGQ/yAUsylCiwcTm2eCkU8TiMPj4ocRgwc1q4jpS?=
 =?us-ascii?Q?mb0GcmmeedrHEi1VqXbtbrBTk4qM0bX55xapGDkguhnuqi0aekcJ6tkDnMVp?=
 =?us-ascii?Q?nvhJhQc6spEsdBvb3oR4B7YnbUhDtWtlY3CI2NOb3ws5dm1q/5f7UjhqQ9S+?=
 =?us-ascii?Q?rrDnxE5nm4UAVjTTVp41beQlyclnf4ZoEWbvOkLHSc8fqSzVlrW4yQDW+XFO?=
 =?us-ascii?Q?Y0CIIDjFn55s1YJnK0TJ1dsVERCA4Twj8teGHlfVjT1uJ7TxcKDIkfU3o9/U?=
 =?us-ascii?Q?WeULUoG9/Kc1TSBLtYmfJPAwUCVZE0uO54Rf3vrhypFR3NjsXwWKifq+K+gK?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aoSJ7719h+AFUp5tlu30Ne39avfx5Im0whW/ynYbpj2gHKSOlQJBsNtX+UGR92R1i6CEOz7BEwHgwAA01Etu8AsinNbUjC4xTajxXe/fbG2ge9w+QT2t43Pv4myrpWbIXTQWMLTiYEn9d7EbvHLKryEfGAmAqMgUTLLietajUWYaZ6rQFXikQ3D+0gS2ynQ6AyVWQ6TSC1d5xQqIcjHfJCm15I/+dUqt16O+OB9CDKcg2X1qgXsw5UvsIrTLtqeGEkOqqzjdh2W3N1rxxJ6feZCdLvYiWpvFRtuDE5eApKjT984pmOFAS+Nk6HyKn1zHfOND20hkwFdfWUqcAFZS1IOHOPGH29hR/BguzU1IBcONIyLLOAk+mB1ynHiwXEkhsSnsy+ol6ljnt+swU/VAJuxkKNgsCPnINT8dsDLUx0kli1+bKJqoCeC/CWm5tOGqDCAwGGyYseQWxbqGpx0ple/JqdHcj2REx7T6bwwvK1hL3U4gscv5CE1qgBcTGt/6UfNfJ2+kcKddv1cVlC/fxgYFjeuajOebBiGFrGwiSOS2FFkboh8MKl0IOL+pndElNTKZ6k86YfST2g6md1XKT7vqOOO5kKYLPxIJe6AJ+BI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11b46b0-7827-4dbc-343e-08dd8db74603
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 22:34:05.1968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWUVG+Fu4xynaBvJ40tnnGIqduzwpAyT5xBjCAIrXdorMzG3Sqfbjp2C7Dd2dbRU2xgwqtRXlkZA/w5guk0dQohxhcNSLuueOFao15sD6Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6753
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_07,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505070210
X-Authority-Analysis: v=2.4 cv=Q6TS452a c=1 sm=1 tr=0 ts=681bdfe4 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=e3YDHgtCKyFiiYWT4VwA:9
X-Proofpoint-GUID: QnBp1p_FtR4K5OSLV5WcKJbwQoGgIjnt
X-Proofpoint-ORIG-GUID: QnBp1p_FtR4K5OSLV5WcKJbwQoGgIjnt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDIwOCBTYWx0ZWRfXzZtJ8H9DDgJc hwCSCfdB8srQ1lNGdz3TmYh2suAkNwe7L7gbaKd1hzZiPudpPXdLtySZ//tU+q4AEjAAYe9upxC ge8qf9ZDMcuY2LYQmAhzAOozSdv+mxIHpIpjqShBL8+7QD5gzv3UvrxAv0Y2oMFyWgyKHleRM0n
 48CESDxLkvty0kz8FIo6o7NjRBCkxmG+s1ug8boN0lprSzZz/DkxUspMGbPfobee64f0tF+jo+Q XgsN/+mqDXOgnmGVpneBDpfFBZp9Nc9/jZg9GdTC51QyTr6gADqtgtEzOsaBlO7ER+nR1h0HSix 2JCHMXSJlpACkDqYE5+r/YlHXCBsPD8yHVuocjvGpPbw6I1MCl/GWPYQdQewjaFWoa+Z6Gk8Dey
 zWgh6q8ILdPk9TToyfUPI2jEVi9IqTwbhROKPfY68JjcXFLwfR5LBaRrXmDoYhQoPHQ+oUqv

In prior kernel versions (5.8-6.8), commit 9f6c61f96f2d9 ("proc/mounts:
add cursor") introduced MNT_CURSOR, a flag used by readers from
/proc/mounts to keep their place while reading the file. Later, commit
2eea9ce4310d8 ("mounts: keep list of mounts in an rbtree") removed this
flag and its value has since been repurposed.

For debuggers iterating over the list of mounts, cursors should be
skipped as they are irrelevant. Detecting whether an element is a cursor
can be difficult. Since the MNT_CURSOR flag is a preprocessor constant,
it's not present in debuginfo, and since its value is repurposed, we
cannot hard-code it. For this specific issue, cursors are possible to
detect in other ways, but ideally, we would be able to read the mount
flag definitions out of the debuginfo. For that reason, convert the
mount flags to an enum.

Link: https://github.com/osandov/drgn/pull/496
Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 include/linux/mount.h | 87 ++++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 42 deletions(-)

diff --git a/include/linux/mount.h b/include/linux/mount.h
index dcc17ce8a959e..6904ad33ee7a3 100644
--- a/include/linux/mount.h
+++ b/include/linux/mount.h
@@ -22,48 +22,51 @@ struct fs_context;
 struct file;
 struct path;
 
-#define MNT_NOSUID	0x01
-#define MNT_NODEV	0x02
-#define MNT_NOEXEC	0x04
-#define MNT_NOATIME	0x08
-#define MNT_NODIRATIME	0x10
-#define MNT_RELATIME	0x20
-#define MNT_READONLY	0x40	/* does the user want this to be r/o? */
-#define MNT_NOSYMFOLLOW	0x80
-
-#define MNT_SHRINKABLE	0x100
-#define MNT_WRITE_HOLD	0x200
-
-#define MNT_SHARED	0x1000	/* if the vfsmount is a shared mount */
-#define MNT_UNBINDABLE	0x2000	/* if the vfsmount is a unbindable mount */
-/*
- * MNT_SHARED_MASK is the set of flags that should be cleared when a
- * mount becomes shared.  Currently, this is only the flag that says a
- * mount cannot be bind mounted, since this is how we create a mount
- * that shares events with another mount.  If you add a new MNT_*
- * flag, consider how it interacts with shared mounts.
- */
-#define MNT_SHARED_MASK	(MNT_UNBINDABLE)
-#define MNT_USER_SETTABLE_MASK  (MNT_NOSUID | MNT_NODEV | MNT_NOEXEC \
-				 | MNT_NOATIME | MNT_NODIRATIME | MNT_RELATIME \
-				 | MNT_READONLY | MNT_NOSYMFOLLOW)
-#define MNT_ATIME_MASK (MNT_NOATIME | MNT_NODIRATIME | MNT_RELATIME )
-
-#define MNT_INTERNAL_FLAGS (MNT_SHARED | MNT_WRITE_HOLD | MNT_INTERNAL | \
-			    MNT_DOOMED | MNT_SYNC_UMOUNT | MNT_MARKED)
-
-#define MNT_INTERNAL	0x4000
-
-#define MNT_LOCK_ATIME		0x040000
-#define MNT_LOCK_NOEXEC		0x080000
-#define MNT_LOCK_NOSUID		0x100000
-#define MNT_LOCK_NODEV		0x200000
-#define MNT_LOCK_READONLY	0x400000
-#define MNT_LOCKED		0x800000
-#define MNT_DOOMED		0x1000000
-#define MNT_SYNC_UMOUNT		0x2000000
-#define MNT_MARKED		0x4000000
-#define MNT_UMOUNT		0x8000000
+enum mount_flags {
+	MNT_NOSUID	= 0x01,
+	MNT_NODEV	= 0x02,
+	MNT_NOEXEC	= 0x04,
+	MNT_NOATIME	= 0x08,
+	MNT_NODIRATIME	= 0x10,
+	MNT_RELATIME	= 0x20,
+	MNT_READONLY	= 0x40, /* does the user want this to be r/o? */
+	MNT_NOSYMFOLLOW	= 0x80,
+
+	MNT_SHRINKABLE	= 0x100,
+	MNT_WRITE_HOLD	= 0x200,
+
+	MNT_SHARED	= 0x1000, /* if the vfsmount is a shared mount */
+	MNT_UNBINDABLE	= 0x2000, /* if the vfsmount is a unbindable mount */
+
+	MNT_INTERNAL	= 0x4000,
+
+	MNT_LOCK_ATIME		= 0x040000,
+	MNT_LOCK_NOEXEC		= 0x080000,
+	MNT_LOCK_NOSUID		= 0x100000,
+	MNT_LOCK_NODEV		= 0x200000,
+	MNT_LOCK_READONLY	= 0x400000,
+	MNT_LOCKED		= 0x800000,
+	MNT_DOOMED		= 0x1000000,
+	MNT_SYNC_UMOUNT		= 0x2000000,
+	MNT_MARKED		= 0x4000000,
+	MNT_UMOUNT		= 0x8000000,
+
+	/*
+	 * MNT_SHARED_MASK is the set of flags that should be cleared when a
+	 * mount becomes shared.  Currently, this is only the flag that says a
+	 * mount cannot be bind mounted, since this is how we create a mount
+	 * that shares events with another mount.  If you add a new MNT_*
+	 * flag, consider how it interacts with shared mounts.
+	 */
+	MNT_SHARED_MASK	= MNT_UNBINDABLE,
+	MNT_USER_SETTABLE_MASK  = MNT_NOSUID | MNT_NODEV | MNT_NOEXEC
+				  | MNT_NOATIME | MNT_NODIRATIME | MNT_RELATIME
+				  | MNT_READONLY | MNT_NOSYMFOLLOW,
+	MNT_ATIME_MASK = MNT_NOATIME | MNT_NODIRATIME | MNT_RELATIME,
+
+	MNT_INTERNAL_FLAGS = MNT_SHARED | MNT_WRITE_HOLD | MNT_INTERNAL |
+			     MNT_DOOMED | MNT_SYNC_UMOUNT | MNT_MARKED,
+};
 
 struct vfsmount {
 	struct dentry *mnt_root;	/* root of the mounted tree */
-- 
2.43.5

