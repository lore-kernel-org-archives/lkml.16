Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB53E155C83
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744604891; cv=fail; b=PlE9LOjJ8BDbLVeM/Dkc2vFW8/R6U3TLUMn634TnK9I/p4QoD7mOag0Qr06w+T7AetEnfYfaQ3vJwHq/iIqo/2jaOqAg3q3Vo5mHHa6eq+anjmqFqDAFiOkMwy0RgAk4BtzTZSzCKoztluHZrK3Wg6rkoUQFUu/7706VxRkuwKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744604891; c=relaxed/simple;
	bh=qHUtjVOHzi07/EK7iNROhIvIcinkCW6IxC1JGyapAEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u4AT5XHnKbIzwPXVUMOJ4iZtAtg8oxyZZ0JaLf+S+1CiqGzuT7dfRqe3vb2ceBNkQJwykXj6S0DnxD4WsV1uD6HJ/XZZ2DTeKKMVWQJx9xnlntz0Mr8uK6KnX79hsStOzm7HQo7Oh3bqP32RUvOX8oovot4+/D4MrUpmCvlYqMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y87NErTq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Dv4KFfMf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y87NErTq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Dv4KFfMf"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E3buF0007908;
	Mon, 14 Apr 2025 03:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=jvpnIooywk121/A9ba5yAbNWiYQIegMHpNkfFCXsNmw=; b=
	Y87NErTq8wZ5b2DQKAxhMI0zqI6c6JyGPX3FoGZXfhtFmmJv80ycOD57LOaQOdjs
	4tp1UYHDd3ydhaodNJcrNgfbkCdRDRKtU0tPBROwqD4EbM81ZHZ2ukHCS+EyVAFG
	dvilYI2MSg4SP/lsmY6eJBLNXVo+NrruSOpYKsTTuYKcQKWS7/I/mQUJin3arhVK
	b5weJTYlhIqVGcwvaxvuF7NTZgJkxmhZcdPsyvxte4rN4xFNBr36ZRSgQl/kAblG
	+CikJooDvnsCGQyGUL2AoV/6IDL7BBXhwifpK+QhB+5DhDRH1GnpgDAMsXfXD69f
	/h6drV8O/LhNjaooxpQ2Jw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 460tm28076-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 03:46:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53E3SnlE009213;
	Mon, 14 Apr 2025 03:46:12 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010001.outbound.protection.outlook.com [40.93.1.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3fxhkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 03:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdeWhyktJQH66khcJm+Q0NEGsFc00RX/AZ09rutvmSzXnQ7g82IjWCQAc2A2YfknoJtMJ9hBUiSy5NHjZTlq0d8tLsXsYgO42sfapZL3KDaaXkU/WSm2+5qXcnwd0gGjHQ5tLPy5+9jstT+Oq5a2p3wfxShGldxrxIwhZA/FRg/+5F/oIrYgJWYFFyxJouj7LyjsVVt34aWGOMygr2d6lhYBC/FBbb57XKpC1HnxRRxo147XdgJfbO19fQcVs35jXxiUVgNz8nUsmxfNgwaYoD9mcajxKp4JUue6fW4GO3caxaPAjWuTfNRIxgrt/TOs8zn9Uc7RX54Srxg5zzYvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvpnIooywk121/A9ba5yAbNWiYQIegMHpNkfFCXsNmw=;
 b=mRbNjlkhanSiKnqVEyJn0eOl5Emw8OdhGipngJVLGfDdbNUwiDjf3taJVu8gX/JzThM+fDPJmZ0/Gx7dNXfL/fZH1dbGsrL46MGJIzhS0iVLn1QhzCOxG8j5KBnDDeEFB52CZy8t/TxAcyAPOcAKylxm5lgaDFrKT9ChXEGmaVZV9SNx33RXPJtU6C/nNdLiaiANvThERDAs8tSBRM3nzzkA0WJOSCtg+YGlEzu9z/9lZQmj1X370ZP2QBw5IkIKmf6hb1+h0x0uhqJ2Jdbsmo+lCah8CgrCANJwTqWDDS+qvJDJ09800KZCJ6zPKVRSvDgTnh/uQ8Buq/m16elIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvpnIooywk121/A9ba5yAbNWiYQIegMHpNkfFCXsNmw=;
 b=Dv4KFfMfCDduwfkY/iFjxj3gH4605U+hwLdpxvNbywcsW4m8mon8A+i3nWxDf57dN+YkUC9J3Nktl6LHXiJY4Hu3wamO132gSWZ/Y+iGrWdq+ZO2ZxCkxCXyl9oBCv5rAwaO20wdHad0xAbS3UCCRPRGyNmSyrWErohic4/M6jk=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by DS4PPFDB583D803.namprd10.prod.outlook.com (2603:10b6:f:fc00::d50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 03:46:10 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:46:10 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
        rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
        jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
        ankur.a.arora@oracle.com
Subject: [PATCH v3 2/4] x86/clear_page: add clear_pages()
Date: Sun, 13 Apr 2025 20:46:05 -0700
Message-Id: <20250414034607.762653-3-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250414034607.762653-1-ankur.a.arora@oracle.com>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0343.namprd04.prod.outlook.com
 (2603:10b6:303:8a::18) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|DS4PPFDB583D803:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc85a70-6231-47ca-13eb-08dd7b06e57d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TJ3d+Ipdo8geV6wal543AUJagHZoDD0TFyxPmOTSKlS6biNqeOKhoyd7HE6y?=
 =?us-ascii?Q?YvWzJRKiDGKH4cV591P0qIgnTU6eT+nr1NUJu35JOD7MvHzi9OABh84bmgYz?=
 =?us-ascii?Q?V2HNqsYADEADDWkdnRiR90nMzWn5vN3gX9/uEht4wr2FBDliIrGhq8gsB5QV?=
 =?us-ascii?Q?K3ZxGs1VU+c1ul/JcJwAhIousUbwvHkg79gqqE2N+3ZIXfR9+YOGnvSJPqOw?=
 =?us-ascii?Q?bid+CBbsZ6fxCSkhXGDiHzaGTqhz3AqzZd43tBtwGPSXvjcHZFUfEeWnCZTb?=
 =?us-ascii?Q?b5pq69jLdXZO6DTNnKfu8+w8KB0ZLRfctBhac/Zy6lOG4XSU6jOdFH4GC6d0?=
 =?us-ascii?Q?BLyNjHeWbkhGQZ7xAJ48Joa5cEAkp/OX91dI1J39pQ1KP4qu2+A5aC3Uwz8r?=
 =?us-ascii?Q?pkxHaWsR7sRJow3u8WdfeM7LdMtGzlFxqZXyCZ19u3FDIz/9ENrFerM0UVm/?=
 =?us-ascii?Q?Gk3+7FG/+YYQfDE7O9UV5So9fOkpsnhTpDV/HxfSSrLMUXgzwt65/58jynOH?=
 =?us-ascii?Q?9ryyQQHlQEkkJVHYjgkB5kkVPldHP6pzEJRY9QMuyBJ2x747R+2W08NBlBmV?=
 =?us-ascii?Q?E1q7UiYAkZdVoelUQxK7JXX2RP/ciy8NHC6b6I3HnSgK+QDF+PMZNvIYch+B?=
 =?us-ascii?Q?QN8lfJmkAyfM1bMEwj8tJ0DFYucXa2JNeQyqL5c90+AQQKJjIM64WiGzADO5?=
 =?us-ascii?Q?1VN6UtBcHKwAic5CCSbO0wuJC+idTZj/mPXsj4Za832GkJtDfTDjVxmtzHQk?=
 =?us-ascii?Q?NMfUlqrE+rrZevvYmwyANvlQ8iPMQANk9LY5HOT8SmPOujYsZ+aNr7+swtL9?=
 =?us-ascii?Q?9+7vN6CFbiXRlbnsMGFkD/x1yaK6sbRqTLKCwO4s4K15eicAly2FZ+YCTH9e?=
 =?us-ascii?Q?0K3A4gCb7Bc42AZ1XdqAJALQz1kAPFpbS4DvCLvIpP1WIb1wlqcz0FYxUN0o?=
 =?us-ascii?Q?6sxynNg371c1ohR9UWffVCUCqoj9E/9Cmtkd/E2vlzmm22YG4hMxkFtmEIem?=
 =?us-ascii?Q?Af3wFgSlyBpfUQj0E/ifZ6/C4Pa4cFyAdwf2Avj6sn12SCvnjXHtAwu3ESGc?=
 =?us-ascii?Q?sYspG2nsGTFVzj+MqEEa5fHQJToee28yEebzGytHk5VmslnPj7lWqAZ8dKX8?=
 =?us-ascii?Q?C9kEh3Zuc0eX91TFEbiIfAdxvy8GT78CWJK/FH4oEqRNKpK70MZYTEF2jVqA?=
 =?us-ascii?Q?O/ZhE/rk/nkkAxkPJ5E6PiXL2aT1XIDy1S7+kebuY4g/lz3JbGwREmPn0J8o?=
 =?us-ascii?Q?Es8TXcQdu4Z0OnY9Re5Shp/IJMnX/8wxvmfA3Ic1ck7KIKO826lap9IjIyXD?=
 =?us-ascii?Q?tZEaoE7H3l4jxxrWjZLDGMRSgyoTTskc0iD9ww78Asv9E9noxlbs0RknKVQN?=
 =?us-ascii?Q?saKrWZzh7OYgglNwsIRiWXwHGdiIO9/Q0XIqFuazL9qet345Zh46gDkm+1NY?=
 =?us-ascii?Q?a/E6PqHFwCA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CT0ghD5wFdJm5m4aFMoqJcd9xBYjvFTuoW4mHltkecX+p48icsihDG1fsY/m?=
 =?us-ascii?Q?/eYX5n4QJy955onoPFSolmZPiSMaTPBfOfCxnUmV4v2q+F2IbhMOSaknaA32?=
 =?us-ascii?Q?PqD6N5jUGcn8vOyTdZLTS/X5I0OFtf7TmaJTDPe9bVTH6vellwvtRAvD6h/T?=
 =?us-ascii?Q?XLq6M1F3C95Sg9URieB7h5So2laevb3aWQvlKE+u7O0oyLPTJs6s471HrBA0?=
 =?us-ascii?Q?tfWrdFXvdo1c6e4LHt1iaLUQFp9uM6ombsvICdee7wl+1qdv+CpvXjA0Dpx8?=
 =?us-ascii?Q?nnrLlcI118Hn/bm3Q1AgATxf/xldUDEgH3hJegEF/xMetpdopXnwdLqa/aLR?=
 =?us-ascii?Q?LsiA9L9nGnmJif7oJnjjdhBuEPGRTK9u57hgpkfDlChYOYIWpkpzb3AeG/2c?=
 =?us-ascii?Q?rJ8/khZGc/8yz+iBBgWuNnZNluMvWfUGkXJjOH3rG5PN8N3Y5pzaQJtzSgKj?=
 =?us-ascii?Q?oOFhicrKHIKpa6Jofa+/e5O8UmIEJRgGO+US4xdWSrJsICf/TDTM9I+lpaAq?=
 =?us-ascii?Q?15h59Hnj0RmuLjiLMzLhQLcn+5BB9JHP8g8kp6t04uPyEvs6rgvhYtT7SU/a?=
 =?us-ascii?Q?PE+wuDhuoUS1dU3v+FcdDPYeAXrlkPLPYUGVcjOl2s8Z6NZbG9oBlhyQN7Zv?=
 =?us-ascii?Q?06dM26t3H+R+zLePZ7kQUBgXin9SHxPmckj3C2TBX3KS8dz0zVp8AyiDGIHc?=
 =?us-ascii?Q?d5BsYSfj8LefZpGhRhoYVqj+aG4nohGMgvZRTVdWBNAXhJooz+pw3vWBsgmi?=
 =?us-ascii?Q?EQG48M00L7VvK2yvm8lCc6eUzF/sgXuQJdUnekPxrjxh0p73C3oCpTg6ojg0?=
 =?us-ascii?Q?DYR8FLuTwDIzIXBd+TGoj17ZAm6F2nsoPxs64AUIGyea0ebI3N5bdKh0AVaO?=
 =?us-ascii?Q?s2xxq9JriJMDyFoIbDR9JrlpLPX+KtqJs9F/ga8u7HiW5oIM8h5KemJ3a7Iv?=
 =?us-ascii?Q?g3b4EZY8S7EWIYwMliQ1QZvEhn1nRegadZY21qXgOekyMJ4ZBAPTbiSUSyoX?=
 =?us-ascii?Q?HcOKHbG5WzgqUHNHcDWQbsIoGsA15wVoja+j8hxIcFi7JbXIjXI4IlXo48m/?=
 =?us-ascii?Q?2+DNssIZmTk1r/T4oFT1IfrvLD+nizk8Skn7FHaw4uk6sI+yU56nBKDwgpV/?=
 =?us-ascii?Q?1Tx58l62+fZGi5/tSxiQZeyCggd115S4dzfP3wJyy9pOumz3L+xUe+mO8H8b?=
 =?us-ascii?Q?n5g85GHVPFHe4aYCii+r2QUQO5QI7gjIpJ5cfKDhHLHE4BAIHVnb7wMR+OKb?=
 =?us-ascii?Q?YTBVz7zdAR8Ci5rrS05EIoRIqzyP/eiLNf33JuOCSLoojQnHpoXVzxMizPBS?=
 =?us-ascii?Q?2O65o3+i7oAUJ3pmw5nlI1U7KqRwkA+1+nIYRK4jYk87kLpaOBkDXAfEWJFB?=
 =?us-ascii?Q?bcrSOTTGuurRs+GzSlkMNba0mhvYpgLwZ9BZMio6ZB5YJgJSnYS1qhgpOnUM?=
 =?us-ascii?Q?FOqvGTJvaK1uFZdhqj7nlf+w4yUJdlGodiHOphYpqGeGwbeJ8OMAPCzqSVCO?=
 =?us-ascii?Q?XH4UC8X134n2vOg/GJYPbUrqWGSfgymYl06IDukZd9mq5GZ3MXvycB8SOS4a?=
 =?us-ascii?Q?QASts8FDGahY4wu2SpOt3EMraNy4mlfHfw0TzgQ/mZSWtTciFe/9KUa5s+22?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YBaYVvS1ZPeMu4e0dx0wudRV3k2DH03oUMFCz5Z+sZRzOS8RvXmz3vUfs6yapvTYzoZouTliQvdaeqQ9m4J3EoNZWUn4xN1ofkBGkbbb8NT2ANuNTYgFkwjsZZb1O02aGe9hHImzdOk6XbN7V0GS5N8MY8AdbYamTgxUmhNBrA86s6bAw1NSyA28cyNv8iKxg0hReU9NIrbjdwK3WSwHUFOwDvXbWR46UAY8j9Z6YjNJkP5AUA/oQWgKxWQ05F6S9ouw0Dp/wOMh8ofuHxcqD0DxggLczipnXYcK9nvZbclsQiinnE/G73DMtJPkMva66tsMVTmF9T9NUj2s9yu3LwkA6Yuc4YB/6lE+bZSMOTgtkmBHnHaxYTER/nl3CnBQP28cxQkm33e/gGmc967/Q0V6+xXu2GYzro7ACRfFqSvf3i9gyMxhv1CWfHD9s/YkZ1WqvCz50EcpytCT73CoCDC2FB5Za2U2Wosam8d9cqbBlcGYRkdc69C6e/cu06cwgg9O9bNLwXOUt9feiBL3iFlGoOu1HHeUBjRJWwEe9TDvEv3uCG59mD1ZFgYVp5deVH3St2Xfw7wZgw/D8JsUWAB2r4KOsbGAM9toR/oLPqE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc85a70-6231-47ca-13eb-08dd7b06e57d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:46:10.7653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FukM796r1seXONLhmUE1D7qqNom6wgQjnd+yr2U/fsKc3f0QX+2BGeWDxtx9VlzdslMxuIeL4dEg7HXIt8gNegVE5rVb8KZ+QRAWs8pU1UE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB583D803
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504140026
X-Proofpoint-ORIG-GUID: Q1WLOQTmTucUHw8OqWOwXPddsF9slvdC
X-Proofpoint-GUID: Q1WLOQTmTucUHw8OqWOwXPddsF9slvdC

Expose multi-page clearing via clear_pages().

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/x86/include/asm/page_32.h | 6 ++++++
 arch/x86/include/asm/page_64.h | 9 +++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/page_32.h b/arch/x86/include/asm/page_32.h
index 0c623706cb7e..73c94c9e4eee 100644
--- a/arch/x86/include/asm/page_32.h
+++ b/arch/x86/include/asm/page_32.h
@@ -22,6 +22,12 @@ static inline void clear_page(void *page)
 	memset(page, 0, PAGE_SIZE);
 }
 
+static inline void clear_pages(void *page, unsigned int nsubpages)
+{
+	for (int i = 0; i < nsubpages; i++)
+		clear_page(page + i * PAGE_SIZE);
+}
+
 static inline void copy_page(void *to, void *from)
 {
 	memcpy(to, from, PAGE_SIZE);
diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index 45db74db9021..6781cdee6541 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -44,9 +44,9 @@ void clear_pages_orig(void *page, unsigned int length);
 void clear_pages_rep(void *page, unsigned int length);
 void clear_pages_erms(void *page, unsigned int length);
 
-static inline void clear_page(void *page)
+static inline void clear_pages(void *page, unsigned int nsubpages)
 {
-	unsigned int length = PAGE_SIZE;
+	unsigned int length = nsubpages * PAGE_SIZE;
 	/*
 	 * Clean up KMSAN metadata for the pages being cleared. The assembly call
 	 * below clobbers @page, so we perform unpoisoning before it.
@@ -61,6 +61,11 @@ static inline void clear_page(void *page)
 			   "cc", "memory", "rax", "rcx");
 }
 
+static inline void clear_page(void *page)
+{
+	clear_pages(page, 1);
+}
+
 void copy_page(void *to, void *from);
 KCFI_REFERENCE(copy_page);
 
-- 
2.31.1

