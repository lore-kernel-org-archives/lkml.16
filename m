Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617911DFD95
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746096071; cv=fail; b=YgpBmHuGj+wpFT849dPZMSbkMViFLKane+SSzOh/GdKAnA8GwDo8iScwi5HqBQ7dI/wzQVKiSPMrum9XFZnMSK5WH0570fRSJ48gvNy7eldrr3Xkwatc2JvWwQkmJ6CTGNyxhpxNVVidrIbIa5+ZZu4TY01UsBbhB5o6CHhef50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746096071; c=relaxed/simple;
	bh=coeV0EvYnQBAyKatiJKUJqLl1YXk2rbqhPtKR7pdDBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W9KzPoph9ohb2J3UtKTf0duAjWDoBIaCm422H2/xwi6EKW7hd7wDX9WFkcvbuabfLbZaQGYNgHjx30SznrT9elmuV37sjCsHAkerKLvhwxB4+X4Dlkg8X8fsEXwIWrU8EhqrbZSdutODd/mLInyMql8cz2aCmhrJV1f/QpK+WbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EKGVS70f; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V9kpVCFW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EKGVS70f";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V9kpVCFW"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5418gSxH020433;
	Thu, 1 May 2025 10:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=coeV0EvYnQBAyKatiJ
	KUJqLl1YXk2rbqhPtKR7pdDBE=; b=EKGVS70forUxyUs6vVYVkaE9isu4XAU+C5
	thgRFUGJky93e+j9IFRUq8Nz8L/cpz3iwn5eN7j/74przhTgXR0UnFltS6q48Ow3
	Htx6FWW9Obb8VlIJg0v6PPYsYEZ0hf6hla8xRIWdGQbkDoDV64avVuPhJtx2EOI2
	1YsBt0ML1vGXKulb12K2nyxxuK3lE/Dq/NYPdnou/FYlsSCDd10sN5aBCOpA5Iq2
	xTZkkPw6LipavB8m1dEqv04n5uS/lHjU6PiIeYMaTssI49u8gPwZSxiYLCQ8Izrp
	4Vx89rnP1atJneHPKdfUJSwBfNMW59tYop7mD86pzqM0yJ1cJkRA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ucjtva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 May 2025 10:40:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5419nnro013951;
	Thu, 1 May 2025 10:40:45 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010005.outbound.protection.outlook.com [40.93.10.5])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxce0xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 May 2025 10:40:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTcaQuNsv7QuXvl4srRmSCDwUHZBwQvJQfMFbnOK8xEAozDS9wSgmBLfycjtMT3hEK67DoyuXlmVr+lzlOeqPTYg4/yRcHp7vwmuhTGCO7zn5tcCUxpg3K1fAfoAAs67dGDPZfkBuOCEU6s6RdY+xEKZIvs6FVQl4PTZMrLJh++O2zvHUoWUJTlb95MKp75byLt4+zgpfzaOawI3PuHqEfehCF30RdMfeh+/PYUJc6fK822tPiBX/UoWLM2/arjXc4aD1he9fpS4Sz8l+mOTJHrkZaywzBRLMyXlGnT4mNfUgR0mNsOQhkUmag8Y/K7HAygRnxgMQWHPhwPISDrHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coeV0EvYnQBAyKatiJKUJqLl1YXk2rbqhPtKR7pdDBE=;
 b=GRWPCAyC+6yt5nSwpAoZXpZC0shY36D9WEeIxxuCYS1cefBjeaEDDPHrTIv+UNU0Dl8obAaaC2545GQ8aZMU5iZIuusd7IwMTNhLHzAwsogDiws9mblOHrI4UZ+mDfsAMZ3LWx2m9JmeEwIwURZ4eb4NnxYbpu+XiHKK30ZrOs7TTZYawf4GUZ6pvQSwTNqiCq4H4MGii9sj4+vXnxKmWzR0CK+Q04cKfCBPc3VV+Znemx5hlj3ImzdFKDi+8aW0HNPX/+1m58sndBpa+79vT9HSn21hLBkD5Nfm5WYlQF6iCcdldIx5mZ9XWf9cYQM5ulwvvwb2EOyeUtBL71Gykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coeV0EvYnQBAyKatiJKUJqLl1YXk2rbqhPtKR7pdDBE=;
 b=V9kpVCFW4H1EMwYQ+sxVYlH+xHO2j69iXjWWFlwvOrRIU+bZk6m3VBT8M7hH00r3ywcEiKA8PfzcKr7OtYtzM3VRsP/KrsaDJqLRsEUFxkYFzH22jgp8vqJt2WqSv6c/CnFqeI5wF9gzvRqv3NDTehLuxeo1EU47hZJj2YDNvlI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF7113AF9D1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 10:40:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 10:40:42 +0000
Date: Thu, 1 May 2025 11:40:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Hajime Tazaki <thehajime@gmail.com>, linux-um@lists.infradead.org,
        ricarkol@google.com, Liam.Howlett@oracle.com, richard@nod.at,
        anton.ivanov@cambridgegreys.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/13] nommu UML
Message-ID: <4e7ad2d6-4056-4d39-88df-183803ae35ec@lucifer.local>
References: <cover.1737348399.git.thehajime@gmail.com>
 <f4242067-0113-432e-b8d1-d26ff5e4a355@lucifer.local>
 <m21pte6z73.wl-thehajime@gmail.com>
 <7271fdc2-5f3f-459d-ad64-b0275265fe2a@lucifer.local>
 <0837b343960cc6392df4a04b974a2ebca4b60b9f.camel@sipsolutions.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0837b343960cc6392df4a04b974a2ebca4b60b9f.camel@sipsolutions.net>
X-ClientProxiedBy: LO2P265CA0387.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF7113AF9D1:EE_
X-MS-Office365-Filtering-Correlation-Id: 54afac51-572e-4d5e-d2fc-08dd889c9f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ywe2QcJt795YdopHKebMhAiKcyv51eqFjAwNNKJPLquSUlZ3/nP1EMMwtQYY?=
 =?us-ascii?Q?2c4SCJek1yXMXmAA12acAQKvLeZ2cIX+JyR/5zS8RxZeXIk4JcZ/bS7uBKl7?=
 =?us-ascii?Q?wv3M4OsvFcdxPSjGUxAiYavaE2pd0NSn/cRj4WbSOzmvcKnhQgfI2D4zx96j?=
 =?us-ascii?Q?wJJIwJr8dbt67P2b5xldhHRPhCAaieQ0FohNwERSgI6w+Z13cLTpB6bLkY+u?=
 =?us-ascii?Q?b2xMJuoVi8Cv2AKMbMbNFKK5LKjuN8sfEVcEKwfBcR436Whd7Sts8rAfwvqO?=
 =?us-ascii?Q?WViUxFFnheMXRK6GQq1/hvWkak3PJiKca+sOU6OqBj6CLe09TQ97aHeCdM03?=
 =?us-ascii?Q?E/lPpYnznOZoDkToIiG1t/6743b//Wa9+6vvg7GoaaOpDipuAi/QJVQ33xyQ?=
 =?us-ascii?Q?jfuq7YuIT5/9pZjV9ToBMRzSZMPLEPIDtSeNazWjjM81s1BsLjN5nF7FjA5j?=
 =?us-ascii?Q?moMESRXnFY64JIGiT/qqd0ly8uMsjZ1V+O0hujZRooTgde5qWrdkjpr8OA5P?=
 =?us-ascii?Q?+QEKkVlOabVkKfYTN8Z9muLZNzecG/17hUSekN/gsfSqJz2CYzGvbr1up77Q?=
 =?us-ascii?Q?w2lf3YYuR5kPQjQoeO00d4J0Zxdc6ALuHm+L/vSXENebr2ssJqej2k8c0p3R?=
 =?us-ascii?Q?WxnquZX2SIVcUH17kbc24EWp5UShUfYIt2mesm9evjSQ3XvjLaTJXaPT3GFU?=
 =?us-ascii?Q?4qUToPWx1Xh9ncOeU2Nxtyc51TW4PirtZii9Os2q0k0pT7qEIipugWVEras5?=
 =?us-ascii?Q?IsUwQmQ8Ne3yPVFuwQlCO8/NHXyabgwH8PTxXtcFvkT2Q4gVsxKVVSVR4fEu?=
 =?us-ascii?Q?oftGDduMnvyf99yNzVUzH0GTocj4wos/q3/0kPCJXPwtXwao3ltcblTwKSWA?=
 =?us-ascii?Q?2IflMXX3XZzbH0/OHQzGDWbePYhZYqV6jws5jjaHsmoZGoN4S4dU0k6r5/Ll?=
 =?us-ascii?Q?g/7maBg1/os3RRtU5DBrcL7ulu7dozGsbAsRe9oATN583FRREVhWSv08UVbN?=
 =?us-ascii?Q?jGYdICuGnN2DmRhJntwEuYD9hee/8ImY9zhLg7yWHsIIexMLSMYVhgoO1Yyl?=
 =?us-ascii?Q?R7f+AijF01myj5GJIbGVxh39Ko+m7v3JvDTBYImX9N+2/px2K/FELxq3+TtM?=
 =?us-ascii?Q?BgSjlGtnqroFcVAzQ0uCsBDK1fGfccjhAdL1acmH4CcQSeoYBI3V4PEd3no7?=
 =?us-ascii?Q?NTLiFee5loummWQeRlGUyaEyuVuU669PzZ59bOg17ZBW6QJxEx9DHGVim4ld?=
 =?us-ascii?Q?KtGvCeNJjcpHEimyNCxCDEz+Bzn90c9lG1h6RzKkFs456wlgcY0IC/V/3qyx?=
 =?us-ascii?Q?zGCIGsgr7mUyk9LS8cgdosMew4GyVq0ZrcUq0lITShJTw61kJOBMfymdDCvz?=
 =?us-ascii?Q?6amivk8+y0ffU9sQ74kOCRbxiKl15bJmV9hyrLb1tsGS3WiaWqgde3s2ETwU?=
 =?us-ascii?Q?AcA9sP8PVRU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0XcxeM9RhrwauaXAui6MnDlTfFY+5h4jZ/oMxTBWycnHX9kC6vKQLi3xoG2Y?=
 =?us-ascii?Q?iZDntFxAkhHo30VVAT1YiNftfYq2KZQqQ7aX2dlNz5eyi1fvg350oQ1bw0Sx?=
 =?us-ascii?Q?jHZyVl6g4p2NyAZK1aylD2A28C5lciAb25dYF9yQTefi8GasUL6Fd80an5nz?=
 =?us-ascii?Q?v3kT6pZTio6nVpn3PhpdfbP450Yo5GsJcgXIL7u4+UJZA11G1TtLuB9dkR8/?=
 =?us-ascii?Q?golz/dAbAY3RTcJ6u1Bcm4OVfXMd9SL5G04bpB0/wVvYwYqfRmbNk4+YVr31?=
 =?us-ascii?Q?gRk10uSy3Dde1bnrVCh5ZAI++knCR/x3kOWFqZO2C6di0iPSDkkdrCAQ+4/H?=
 =?us-ascii?Q?JGOIovxliAVF5nspbJ+B9AQ5Tznpjlcv8ZaA2Sl/fU2Tj7lNh7Nwa5+PunLn?=
 =?us-ascii?Q?TNnj6SYm9GABqMw8yT+XGxFOEgMK0/n56JroahEjZK0q/tbp/qwo+yr1GowX?=
 =?us-ascii?Q?aQZ2hy/GEyT7gC01m6uuk69n4GeDBgg3P6ikAE/wRY0U9MEpagzzRzS7WDuR?=
 =?us-ascii?Q?KA21YGDWzNGyxFy0IYuP/wLJkR9vT2PpgXQTEHcjIhr8o8Di1ZHWp860BHKn?=
 =?us-ascii?Q?vmkLxn/0ySQdI2MmuR/peehOgzH7uHPqvSocwQjBHjqGJk5EFFJbKd1FzKp/?=
 =?us-ascii?Q?wSG15BVm3Qq99qYf8zo/aeObacg6FqZhr1uQ7WtN1MJ2Q+5JRvrLSpmOEDnJ?=
 =?us-ascii?Q?NJqch6V+J48hhcLBO8wpa0FgPqqv4oLro+fe/J7AV+ay+ShfKhSomazElGE2?=
 =?us-ascii?Q?vhfDS72aiB08jJtzzmYeGKLipuvkF7pmVjv6oR8xtojnCiE2xGcBWiM8mSOE?=
 =?us-ascii?Q?wQY5h/FOKNvMQYeA9q+duJ07HbJF3g9MrAhw33jyTPSED2pNaoi3ELP+F3lv?=
 =?us-ascii?Q?i915hwywUCnvYh7CHv6IcFG1QUulEgwXSWDV9W4QskrT6erphhllhQL4ar/Q?=
 =?us-ascii?Q?C2VHI4uh9Sbjvmo5KS6YA3JQuOj6PQdt8LSottoeHpnEjmEAQBssOyhSXH/e?=
 =?us-ascii?Q?RV+cPwAxvCXA60Dj4JokQkoF7hD4gLjoGpgAUsoV/MVcNeb1E+tnetUVw1cB?=
 =?us-ascii?Q?HyJPB5UotXGrTs3uRiXXXRX07cpw++OTzgSduKcCL9yq6V6ofH6cHjtNQSw7?=
 =?us-ascii?Q?/WCm9xBUmbOrCQc74LPianHb7JGO+P4InufemMxsIo9FD8IhDb9d6wpEM99y?=
 =?us-ascii?Q?vO+4XUzkm1IFlppciheucDK616Q2q31jtMpexOSd0U3PgGJKesyCn3H8BfQc?=
 =?us-ascii?Q?/HYhWwbZg+w8W2CIdYNr2M8GpCt2gc+eIMe58b2BI8/Zn57JQ16V/1TrDh7Z?=
 =?us-ascii?Q?cdmqYlfgr5en/ziOIdyuXkDOio6M88kPUmBCQM60X+02Mr26era9Py40m0lY?=
 =?us-ascii?Q?TtVMsXdNsHmJCEcXLNFQqV+mIHUH8zKwl9uC4oJbHXPnJf7W55tBwW++8BI8?=
 =?us-ascii?Q?URWqMwUV/gknO9EvygmCnO86NULPnw2vTnM2j2xgZdpBYQrCSipmj5EwzwIA?=
 =?us-ascii?Q?K1AShsY3/at3k2g1lwkK7MKUBKr+GaVVdXrd6F6iwBOsXw+A9ymYLedvPhQF?=
 =?us-ascii?Q?o4ydcm6TUTWRRZKRDsdaebwjtTkd7KE+V3CtWRYBKvrBWYPqmvkGgCYorMvv?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FeoDxcMpGI14DU3OJpqYgOhfV5SmX9lcPHwn+tg3zK+XBoKN4tZUDgEA0kFt4ArhpwT+F7mPJZBmje+mNZa49dNARiSS9r0ItIglkKJM8FXUrbl/1cw4YQJvDFUZjyePAfN/YrODd1txFFH/BUkRvYLRKLR9YK8R6ItWF7wuTlCiplBYfRkVp368J5uymaeKT2AaHArAfUBBKEGOj/Md3jd1wYbY8vCUDOwOr7Df6ITnq6W18zVf0Hb0hPckcTa90w+lEj8c+yDWygJa9lpQEiMBn/07qapMJ3frgBdStVm0pprFmyXgm0XYzKN0C3QvST9E9ew7Xn/0uZHLoA+ubvFxKxYTn6/sy4Kc33NVAb+9EH2oNB0Ix7nNWEFmma8sO/Nom8OBw4e96lWDL4xRbAu4lyY5CtnUyqYc9BeQzHzCvwQX+CnOFbbPcnpldOyt19VGflHvgUuESyVqBwLK9qRLl1CrFisYITqRQI6Q2Byn7ElAPhJMxK6sffiKV4ezkktzM+saieBnpZ26CEy0hMFCtMg//Xm9MUDGnL28SUjdoUPT2Sbo7uDjZiORYJC3Osnp8++dc3NbY5cfySN7sSAEltRBntd8X+zbQTpGZMk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54afac51-572e-4d5e-d2fc-08dd889c9f52
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 10:40:42.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foBEwyAHE5vP1dO9NALMhT4e47qQkoE/D1muoL6xSE/5ZLH0leSso9+HoyuZKgFMCK0xY6OLFI7v7hY71d7GH/SKbaf/9TjlfkfD/iaYxhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7113AF9D1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=758 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505010080
X-Authority-Analysis: v=2.4 cv=ZsHtK87G c=1 sm=1 tr=0 ts=68134fae b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=RVklHTeYhifbDW8HiQYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: FbuT1ph9pvK7Sbu59zQ3_LpJTPKzHQVP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA4MCBTYWx0ZWRfXxKLT+t3TYXdT Oj2SnUeEPWzArZY1rmVdKGudTWdwm7Q2+RKb3vWXHApy21p22ujYg4v0AJIEvLh0gLLHJi1Q5uB 3z6CVYrWBVtheiBAViAzZSOib8uV2WBhI40etafjHH/sEkpiAUl9c9r/IvbqbahhCkHbS9nGS21
 P2Q6sTyptCvWOJRWAmSZpL4SiGE36GgCaot65OrIbB1LKrySiArwrfOIX44fmpAbDGzlsbB2mbD hqHY02CqOraI77CKheZ6Lzk+P2KUfUmerrsreW3RHL4G9cdw0rhgcNrc/XdNPamC5+WLJfm+hbJ gKB3krtyEc2xIyUWOlwY7cBjXekQ0KfnRb8q4xWrzAMxH8GbpZrkB3ha9PNhodoDVdhKZQsoNcZ
 GDaucJO0ID7rX3w2EWkXmHWHM04OTFF0wPVrfPH9Yn1xpI5gdiG9WejFldYMpB3LqvIra2AE
X-Proofpoint-GUID: FbuT1ph9pvK7Sbu59zQ3_LpJTPKzHQVP

On Wed, Apr 30, 2025 at 11:51:47AM +0200, Johannes Berg wrote:
> On Tue, 2025-04-29 at 14:23 +0100, Lorenzo Stoakes wrote:
> > Thanks, appreciate the response. I would say send a v8 that's rebased to
> > make life easier for maintainers :) if you already have it ready to go that
> > is!
>
> There probably haven't been that many patches since, but I guess why not
> :)

Appreciate you having a look again! :>)

Perhaps I'm being selfish :P but it at least needs a rebase, perhaps just a
trivial one, as b4 shazam refused to play ball when I tried.

>
> I was sort of hoping to get the seccomp patches from Benjamin - that
> have been waiting far longer - in first to see what overlap if any there
> might be, but I think he and Hajime have already concluded there wasn't
> all that much overlap anyway.

Ah thanks for the insight, hopefully not too much friction on that.

>
> But it's good to hear that it'd be useful to you.

Yeah, I (for one) at least struggle with a workable nommu setup, I had a
buildroot for m68k-nommu but it broke in various unpleasant ways, so having
something really straightforward would be hugely helpful.

>
> johannes

Cheers, Lorenzo
