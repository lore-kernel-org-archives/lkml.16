Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE8B22A810
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309418; cv=fail; b=W0mzdLi6CY7u+rE4+4T2+llFOCYp9vuXID5LfVXhybbCggeY/yv0bTfJYKa3h6thoS4lzvJNJV6k+eokicbLgjCfJk2gZ1Pcy9vlaeufb9knXKYVF5HAhTwwcVIChqugn6d0nOAII5trTFh48eDp7b7aRDN43kGH1tjmedZUXO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309418; c=relaxed/simple;
	bh=jKZORa4g14kSfcnKrOuxymjZ8DPEq63yyK58MBFFU84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QbA+o1zp0H14qPHC8OsLwlRoABo3WeE6X/AnjKse0Ytct7oodjmWFdKwituTHKxZrdpDS+YSN2UQBL1XtH7xgt9jHjEzT7W4OOzpk/BEF/1T1GIiHAqvnSy5Koq6GnesslN7qMaGkUViKMVN91dQE/N/f3kqBmNJ7gkpwisKDN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FKWVwBsh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y0Vpbu3C; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FKWVwBsh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y0Vpbu3C"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7NQoY026663;
	Tue, 22 Apr 2025 08:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=8B74GaCLue7r0Bt62+R38Fa8FABO8o7zSAGbPu6YmJ8=; b=
	FKWVwBshesQFTb6116E9wCWM/oFu9kTr1HJuJ8cdQRHdeGy38JrZchaxr3Tmoi4p
	tbpc2376Hi28wK0AeIIzNgAvz6BSIrVw5nInM7zIWtzJEopprc5V6ViPs0+/nEsI
	1QjHdFm0m6TCpuPg8W0Qx/A7qH0p8TBIB0z4ojnogx+mJiURO6xqUbVQw1GMGF3q
	7Ku/IOe0tFRA8JwL1ein8tsd4zPtCnkYke7UwM71kv2Av/vNv7ungPiWmmFqtFU3
	F6UwwwQQir5n2XxO1I64C9coztowf8glfmVm7sLpOMVRGKJb7sOU+3suepxWn74F
	hvXY19xyI51VCgPusmmpDg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4642m1uyys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:10:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6XkWt021143;
	Tue, 22 Apr 2025 08:10:01 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010003.outbound.protection.outlook.com [40.93.10.3])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429fhskd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:10:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzstWzfwzybViuQ4ob1RNmM6EdVsiUSNlStNdKbIhad7wFViBVqNKeCTTbJjiyMX1o3nhgiT9gqrPBV6VK6KC7gySKjzglC2qH9yY8bKd2/dxP82d4m0to0DPxD8b8rTb6vSgysYXWJakxondAODgVIIDRgILD6KGmdh2Gwsw738vjAC7wZHwf3H0zdVfhHFH7sCPResNVnIrHdbyiUAYyXcACZWhKsp/jjPWJ3V0ZXfQd3lD8JRk0XLktKA2VX2TcxEN+++ioBoxLMiq9Aeshr893Nk6T/qTF/sEC4EpyRxwL6y6YApEko/7AdqfuHXVOjntqaatbRdZ9ieLs6CNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B74GaCLue7r0Bt62+R38Fa8FABO8o7zSAGbPu6YmJ8=;
 b=mxq7WfTV7i/m1DO02wTZk9oQ+Y5GqNmdcg+hMRZm3vQA/1oB5gWr1wms4gN8glUGAfC6VFxm6MbIQmAr2kycUxAvPht01QZCDsOea7mt4Wfx7/o601RFnNZHsmeFA19ELYHVdyaY4T26GHxwr9vL5VorbYkiRPJXKAWG32XghFUaXPRspiTXFEqrkCSiydW3H/BGHMRuosyv55salQA2zyzk0FaGLMMR3newnrPX8VwZYtgRIY7C5aTNGhLPkhIlKX0qa0GKDUekm2Gli8xxZug7xv8YlA7KUZHzvho5X8N8SR1dn3Xnr3iGpNen2PGMni79s0/As4hDPkbamQmRvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8B74GaCLue7r0Bt62+R38Fa8FABO8o7zSAGbPu6YmJ8=;
 b=y0Vpbu3Cy/AKjjkD1pIOpE7UhXfUZBkqoueJHfdbkOJAMGCulw+SD+sn+9xtkzgEy37Tg4Zi7MebeU6Caeoh6TvZqY6ZxufrxJaUQV/IdSP/GGS8q/8eVOF/PTC89ITjGapk8zRudAuXMERG0vvEnvmAhduFFNeXaVjN5My3cns=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4587.namprd10.prod.outlook.com (2603:10b6:806:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 08:09:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:09:58 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 06/10] tools/testing/selftests: add mremap() cases that merge normally
Date: Tue, 22 Apr 2025 09:09:25 +0100
Message-ID: <12c20c5d02c8f7e6ac6f5b581b6237fcf9e9d7ca.1745307301.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0511.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: e8166b5b-f154-4db4-ae3b-08dd817512d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GhugI1XGKIvCuhHkBevoju1bp+Gm0hMD4BGURy0kaZcLvKrV/624gReuY5s2?=
 =?us-ascii?Q?IAcbc5VLvZYf+umH0do1qhyWmDodXL+OOzvCvopZkTLw3hXr5t/N168RGNTA?=
 =?us-ascii?Q?ZnQquaRiumlg1OVUmZ78qHBX0VMvEhsq9BTir1dl6XruLLkZQ+3IKupu8PmN?=
 =?us-ascii?Q?5m7dzgDQhZTJNYr2Y9XBDPvW4hcH0FZINBxWZABGV9qtZNyr3IcL88NTPfsh?=
 =?us-ascii?Q?JwL0F3bU99YSZqEN6IK3teLd8k8u3/QaxlaOkOc9U2kTor/lZ7wRPIh1BAOB?=
 =?us-ascii?Q?Y9tC4eL8dNQ2dIVb7mQUQWqR++4X2tXCCzSzCUWEj6E9kDFDAhrUuQV1x6En?=
 =?us-ascii?Q?ZoKKFo1QvUAEStsl9kqEcLT59hSha4flDVPJ+RuxQTIYj8fzw+LhiFKb8t0f?=
 =?us-ascii?Q?YlDuSlLItvs8wMLy/w51V5lb/YPqsoiz/OX5yWapgTRHyw/loAWNHmiRd1dJ?=
 =?us-ascii?Q?d98O6g55GiVsmjtDzs+DcjMzaXEivJ8PPUtT57vxisqyQly6cU2akqoxvOiq?=
 =?us-ascii?Q?9dxSOnvT3JpnTK9qonmJfB05IISnLBghyQBxcbuov8C6PF/GLtJk8Us2bFY8?=
 =?us-ascii?Q?wjeolAINWrcvlzwN7Y+VhZILEIuP+EcVCNkyVbyocMENhHfw5oLzjDSBtm+s?=
 =?us-ascii?Q?utwIeArsTuV9rMIsDPJczucLMTvT7Og0gx12lIfr/6XUOcemR+CdAaywMarF?=
 =?us-ascii?Q?KgsorywaOVEhqOZPvenLmjTJMxyfSA+UAjPVfrMoeGbuT7XutIVeVA7rslR8?=
 =?us-ascii?Q?GmSEFogS3oTcwfhPH/KULQnzEX/VD+K/Lvr+nz6JYbdyXY8F+Er7oHwMClHS?=
 =?us-ascii?Q?xhuRypdRg0t/Nphk1f9B0jyIHrThwvfyfKoomJIzAFnwVyqRss9JS3WreSmp?=
 =?us-ascii?Q?WznDjJQSPHCDlZCb8tuBP2biq79EyySy6lsoipKO8Ntdy7YDHyxPh9bVpBRK?=
 =?us-ascii?Q?/IoBjqVY+SWnRzlHXyUIBMzadGSk6TRx2wzFWjmvfY0xKgv8bBNZptTxcl2z?=
 =?us-ascii?Q?aOQvMk71Hoxi/DfOInMFP4l0J4YGsvH8mQaVPIdKdUXVgu4eg5oQ0o/iDzM5?=
 =?us-ascii?Q?mqX5aVF38WRiFo7+sy39FH1kO+tKefsPoPFY62rNyy1iis5lnQWR997CnwO6?=
 =?us-ascii?Q?VYAWs3VNIi8xE05s3CoTfyFzKdrfbLT/yePe3DXcooCvdEvqcg72KYU6E2AG?=
 =?us-ascii?Q?JcIAgJouCHFSewMkaJSb+Y+yX/D8lmG1XZoHoxIkC8QkgGiVwLj+j0t8cvKR?=
 =?us-ascii?Q?/YhnvWrJDcm/AIlEnnEZprwsmh+Jj1EWh1jAdikTm8n56PFF9fW6FIkKJCbd?=
 =?us-ascii?Q?XPszuEPCoHm/LKktj3hjLNr27ezDwKhP1y5FV/3ZQMOefoWF4iUfp1Us8lBO?=
 =?us-ascii?Q?olvPBe8k1Jk7IFTJ0OeRCKfTJS5C2rIgFrulFA7x6WBxl4gVjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X3SnpuLNAhGGI5FjJ2bSjJJg/Lo/jYu5OBvRJbRSiLI6FPJi1llNvHrqppGB?=
 =?us-ascii?Q?vR81K4b1DXYYktDfR+gZ4nT9SrwhaK37yZU/om8h46qFa3RaoISx/oLns6tJ?=
 =?us-ascii?Q?AuT48q2IMtsYXPA2kAU4vACNTLpZtldWRq156g7pcG8J89rlEIp4DBOu3Vo/?=
 =?us-ascii?Q?uBPwC6D/vv88W5awBeBdTdP47bFD2M0x3YgeHLHqh/X1OWlJZYd7x74Bjwj1?=
 =?us-ascii?Q?wHVFoPUut7g6v3+uPUPwHBiY3CgzN1BTUm2r9BahWy1PBvjB46PkJkGPkXVr?=
 =?us-ascii?Q?nrLIDhkcxKJFdrxa2QqYPLfqK1ECGTPNm8+TyVy5GcqgcQ7yXzN6aL9MAdo8?=
 =?us-ascii?Q?dtG88/lSZTklXXALvVhi4XLk/M2SVQmfql9aogt8t5ERrM1PW1CYKjsJIx1S?=
 =?us-ascii?Q?V/JItmmVCUCIm73xmKtRluG8SZnizrvklBmCWsRxviQFrccJkoOkjO+vs7+8?=
 =?us-ascii?Q?XULAYKhz5HmjgpAKE1KyBqyysdKWGe5h5ymZ8ZA3j80CWVmCnHPWG07vC/j2?=
 =?us-ascii?Q?C+ElBA8nfpPe63rQzGg2tpeyRVE47OeOJ22Agobexitz0OXPNOnXFD7h/QyZ?=
 =?us-ascii?Q?ow8ctLpvpV5qAhnd4IB+sdd7aVhbVbNo18S/gRQT8g2cnOgC4F58rBaBEqVY?=
 =?us-ascii?Q?eITX9wkSn+jFKZaIUM/p0MqBJ6XyyEOfiyZR6rjXG+5fcouOoB/fgm4UmNnC?=
 =?us-ascii?Q?1tZC/Jwi9Yycn7ZJW8pKR3Mkei8b6gYgkjjrMX9AlOuWbsPjd0r+x5IKWRth?=
 =?us-ascii?Q?H7Cq4zfl+ZfXUStBD7YIqKFrfGjC1F0S9027aRHejCQ6n7cwMe/jlvar3AnX?=
 =?us-ascii?Q?dA65ZYO6cCN/E/uHkk+oumPXL4g0SXnrB3vMbfFMh+6Am8i/Ps87pzrT9lBR?=
 =?us-ascii?Q?xbxDUQHyrLuoNuL95d+/cH5ElMGoUpquLsBsvDOjfYvBzODcjSVZGVQNO7Md?=
 =?us-ascii?Q?OCvsNEmZtgvUbIo9fHANNGAhpg9dF021ABo6SR2lOMSIixpSrPcf2cJiN+eC?=
 =?us-ascii?Q?Px7Yx0dRji03/h4Viy/UP+X5lN6ramVYdqWb5s4xpQBxIEL4lMXvJtvod7XP?=
 =?us-ascii?Q?YmBwbfxuX2nviq+fn9OUTD34Rt8BnjUTxD59dVCD1z3ypWsqEkIC+QuL/7Av?=
 =?us-ascii?Q?/A5A7eaQ4Pj9cNI/in8HKIY/bsnkQHY4Mh3Kbaf/YJkPM2NQHDzoppDr9+C1?=
 =?us-ascii?Q?CkzJyiXaOwLsR6AkrU+DCNhlgi+Hd8J61Nu2JPwr2JZHqKVJYhlPmoksvxjf?=
 =?us-ascii?Q?v6aZLPMpv1MTMLvcROccdHvLkfI+eHBwg2k37l7vRzWoGSg2yPFgNyM7wMHB?=
 =?us-ascii?Q?fJgHJEPZ9lHdFXZEntlK1/O5roqKw6pOK18fBWlQqKMBJg2b5b6yX0DFlcW3?=
 =?us-ascii?Q?wjzNRlkc7JSvmqBPOULmfy4AZehUT4sQ9g29uCAiZ4D4fO73hpxs4CS09uRD?=
 =?us-ascii?Q?xsLcMvN1SnPvPs6vGfY3eJ19/zUnF63icpU3e2B9jTG20ksJd8+LTscbbzvc?=
 =?us-ascii?Q?cmOmIT8iw6G8vuRr8jIYmbXO7XzJBxbue1OkNHDbKwsV+akFcKh6g/RtodN2?=
 =?us-ascii?Q?AxluzwEMswWVhyIhvitFLnjaxm+4VeggsOUNiqoJDegOoDp+fncJ9NN0IQyb?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Dkwz8P0e59sVYkM34TeHfmcc3RgDSb32gOyGrfQ/u28cOEpONJBycJd1du1f9si3Wu3HAOEBOymtW4u/cfzu0LcFGFUl7ie4VawA6FqDZjHmfYc+r0YPTttHzDeKur0/XtQvKiAa3j5ANcHIJUijMoYYwVLMmvgJUsrSeWJyY471ybweL9svEkwJSCnb1R0Dncium0oXdcsMSMWbQe9eLbt3uhlMrdV2nN5aYIok9tJfqJ1OGkzT/UtWWLJ9ifOmtIw6WihWBoFZ5VC6ak6JHEPe3i8Do9znP6v8pz13TeLABUB8sJGLgJR091f9dkhol/d6SLEx5Br9o+4KJT+aMi7aMwEZ4xBCRYprwPo09XXc0YcN3ZUCwhJhUQpYMFDznZ+ucxYKrJ3ZeQKwHBMYJljb2S4XmoIGqzR/VvYpEfyXKXL/55Fv/7aGrrvD4xS5s5DJz+1yhWvY6d6UjvnZodElAqVL2HBNX9PomODFqkSRtLogoxqbfKW/1q2vYEOXHK23EFcyPPth+2aIVLBVXjPWTyynLyraXBfpJGV/JDcXEwp0zzYMnxbdmQDwbM0ionwCzRX/MSINVLO0m9sdrnPQzbP2sZPcZqKrgt9J12k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8166b5b-f154-4db4-ae3b-08dd817512d1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:09:58.5215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcRvjvzAqlEi8Hm8jbppKEKP94wvxCkNji4BIXt7DJgDePbzxn0FLOIFNroajAON1qlmLH2egdiQ4s63QmjEjjQeIn3Jn+3JgV0oUaA8w0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=906 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220061
X-Proofpoint-ORIG-GUID: d5Vc-6VTv6s8vJnTEXHZyUnzzLDKERCD
X-Proofpoint-GUID: d5Vc-6VTv6s8vJnTEXHZyUnzzLDKERCD

Use a direct system call version of mremap() as, when we move to using
MREMAP_[MUST_]RELOCATE_ANON, the glibc wrapper will disallow this.

Also import linux/mman.h (which will amount to the local tools cache of
mman.h) to enusre these header values are available when later added.

Then, add tests asserting all the mremap() merge cases that function
correctly without MREMAP_[MUST_]RELOCATE_ANON.

This constitutes moving around unfaulted VMAs and moving around faulted
VMAs back into position immediately adjacent to VMAs also faulted in with
that moved VMA.

By doing so we provide a baseline set of expectations on mremap()
operations and VMA merge which we can expand upon for
MREMAP_[MUST_]RELOCATE_ANON cases in a subsequent commit.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/merge.c | 599 ++++++++++++++++++++++++++++-
 1 file changed, 597 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index c76646cdf6e6..746eacd0fe70 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -8,6 +8,7 @@
 #include <sys/mman.h>
 #include <sys/wait.h>
 #include "vm_util.h"
+#include <linux/mman.h>
 
 FIXTURE(merge)
 {
@@ -20,7 +21,7 @@ FIXTURE_SETUP(merge)
 {
 	self->page_size = psize();
 	/* Carve out PROT_NONE region to map over. */
-	self->carveout = mmap(NULL, 12 * self->page_size, PROT_NONE,
+	self->carveout = mmap(NULL, 30 * self->page_size, PROT_NONE,
 			      MAP_ANON | MAP_PRIVATE, -1, 0);
 	ASSERT_NE(self->carveout, MAP_FAILED);
 	/* Setup PROCMAP_QUERY interface. */
@@ -29,7 +30,7 @@ FIXTURE_SETUP(merge)
 
 FIXTURE_TEARDOWN(merge)
 {
-	ASSERT_EQ(munmap(self->carveout, 12 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
 	ASSERT_EQ(close_procmap(&self->procmap), 0);
 }
 
@@ -452,4 +453,598 @@ TEST_F(merge, forked_source_vma)
 	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 5 * page_size);
 }
 
+TEST_F(merge, mremap_unfaulted_to_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Now move ptr2 adjacent to ptr:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  | unfaulted |
+	 * |-----------|-----------|
+	 *      ptr         ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |----------------------|
+	 * |       faulted        |
+	 * |----------------------|
+	 *            ptr
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_behind_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Now move ptr2 adjacent, but behind, ptr:
+	 *
+	 * |-----------|-----------|
+	 * | unfaulted |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr2        ptr
+	 *
+	 * It should merge:
+	 *
+	 * |----------------------|
+	 * |       faulted        |
+	 * |----------------------|
+	 *            ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &carveout[page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_between_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/* Offset ptr3 further away. */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr3:
+	 *                \                 \
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |  \  |  faulted  |
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 *      ptr       \       ptr2      \       ptr3
+	 */
+	ptr[0] = 'x';
+	ptr3[0] = 'x';
+
+	/*
+	 * Move ptr3 back into place, leaving a place for ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                     ptr3      \       ptr2
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Finally, move ptr2 into place:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  | unfaulted |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge, but only ptr, ptr2:
+	 *
+	 * |-----------------------|-----------|
+	 * |        faulted        | unfaulted |
+	 * |-----------------------|-----------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr3));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr3);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr3 + 5 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_between_faulted_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/* Offset ptr3 further away. */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+
+	/* Offset ptr2 further away. */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *                \                 \
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 * |  faulted  |  \  | unfaulted |  \  | unfaulted |
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 *      ptr       \       ptr2      \       ptr3
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Move ptr3 back into place, leaving a place for ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                     ptr3      \       ptr2
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Finally, move ptr2 into place:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  | unfaulted | unfaulted |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_unfaulted_between_correctly_placed_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map one larger area:
+	 *
+	 * |-----------------------------------|
+	 * |            unfaulted              |
+	 * |-----------------------------------|
+	 */
+	ptr = mmap(&carveout[page_size], 15 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Unmap middle:
+	 *
+	 * |-----------|           |-----------|
+	 * |  faulted  |           |  faulted  |
+	 * |-----------|           |-----------|
+	 *
+	 * Now the faulted areas are compatible with each other (anon_vma the
+	 * same, vma->vm_pgoff equal to virtual page offset).
+	 */
+	ASSERT_EQ(munmap(&ptr[5 * page_size], 5 * page_size), 0);
+
+	/*
+	 * Map a new area, ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                               \       ptr2
+	 */
+	ptr2 = mmap(&carveout[20 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Finally, move ptr2 into place:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  | unfaulted |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_correct_placed_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map one larger area:
+	 *
+	 * |-----------------------------------|
+	 * |            unfaulted              |
+	 * |-----------------------------------|
+	 */
+	ptr = mmap(&carveout[page_size], 15 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Offset the final and middle 5 pages further away:
+	 *                \                 \
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 * |  faulted  |  \  |  faulted  |  \  |  faulted  |
+	 * |-----------|  /  |-----------|  /  |-----------|
+	 *      ptr       \       ptr2      \       ptr3
+	 */
+	ptr3 = &ptr[10 * page_size];
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr2 = &ptr[5 * page_size];
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Move ptr2 into its correct place:
+	 *                            \
+	 * |-----------|-----------|  /  |-----------|
+	 * |  faulted  |  faulted  |  \  |  faulted  |
+	 * |-----------|-----------|  /  |-----------|
+	 *      ptr         ptr2      \       ptr3
+	 *
+	 * It should merge:
+	 *                            \
+	 * |-----------------------|  /  |-----------|
+	 * |        faulted        |  \  |  faulted  |
+	 * |-----------------------|  /  |-----------|
+	 *            ptr             \       ptr3
+	 */
+
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+
+	/*
+	 * Now move ptr out of place:
+	 *                            \                 \
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *             |  faulted  |  \  |  faulted  |  \  |  faulted  |
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *                  ptr2      \       ptr       \       ptr3
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Now move ptr back into place:
+	 *                            \
+	 * |-----------|-----------|  /  |-----------|
+	 * |  faulted  |  faulted  |  \  |  faulted  |
+	 * |-----------|-----------|  /  |-----------|
+	 *      ptr         ptr2      \       ptr3
+	 *
+	 * It should merge:
+	 *                            \
+	 * |-----------------------|  /  |-----------|
+	 * |        faulted        |  \  |  faulted  |
+	 * |-----------------------|  /  |-----------|
+	 *            ptr             \       ptr3
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, &carveout[page_size]);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+
+	/*
+	 * Now move ptr out of place again:
+	 *                            \                 \
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *             |  faulted  |  \  |  faulted  |  \  |  faulted  |
+	 *             |-----------|  /  |-----------|  /  |-----------|
+	 *                  ptr2      \       ptr       \       ptr3
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Now move ptr3 back into place:
+	 *                                        \
+	 *             |-----------|-----------|  /  |-----------|
+	 *             |  faulted  |  faulted  |  \  |  faulted  |
+	 *             |-----------|-----------|  /  |-----------|
+	 *                  ptr2        ptr3      \       ptr
+	 *
+	 * It should merge:
+	 *                                        \
+	 *             |-----------------------|  /  |-----------|
+	 *             |        faulted        |  \  |  faulted  |
+	 *             |-----------------------|  /  |-----------|
+	 *                        ptr2            \       ptr
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr2[5 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+
+	/*
+	 * Now move ptr back into place:
+	 *
+	 * |-----------|-----------------------|
+	 * |  faulted  |        faulted        |
+	 * |-----------|-----------------------|
+	 *      ptr               ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 *                  ptr
+	 */
+	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
+			 MREMAP_MAYMOVE | MREMAP_FIXED, &carveout[page_size]);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+
+	/*
+	 * Now move ptr2 out of the way:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                     ptr3      \       ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Now move it back:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr         ptr2        ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 *                  ptr
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+
+	/*
+	 * Move ptr3 out of place:
+	 *                                        \
+	 * |-----------------------|              /  |-----------|
+	 * |        faulted        |              \  |  faulted  |
+	 * |-----------------------|              /  |-----------|
+	 *            ptr                         \       ptr3
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 1000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Now move it back:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr         ptr2        ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 *                  ptr
+	 */
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
 TEST_HARNESS_MAIN
-- 
2.49.0

