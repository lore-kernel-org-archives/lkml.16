Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350ACA31
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748412595; cv=none; b=UF0UDnXxax49NmEw1zTRrbAyhhcwEcyUKyOTnPzLzz9t5tA40D7PN8tHWTz6Mus0NzFppSuocci2iIG9YmIIMh57nU6SUZu6jGNMOysw3Ypz9qbGBFiPABKks9GL7ewCI2W837undss44ys5J8kgCL8Wxy9dK5iT34esRw4K4sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748412595; c=relaxed/simple;
	bh=Cm2WQBvGDdnbOhUgw+aqFyv8b2NNJSYKPCbP57tCM44=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bC8W99Q7/Vf11J7RvLdTyW+X0rkK8frHCqVI5ABPIRfaLNJI0oxW3zu3Nd7gYvz50w8zdozSvfW+Gqxpq8qWnk4VpGX4A2A8zjzpR6EPdVXgHbUghDFYOE3ZJdWqv69eaPp3MHQLFSCJjP6T6ddLHgSkrcdaZfiy2pfq5G62X6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Od+WsNEX; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Od+WsNEX"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S0UYl6012458
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=pps01;
 bh=+k25hQ+WqRqC0OyADCvElYmO8j09G9PUeHVk4OknG6k=;
 b=Od+WsNEXXnkcV/qxx9G41BPSIRFL838DSkgi8K9RiEA00nJxC8bWNmML9Inf8JQ1FWSu
 mq6N5ibt42e4Y2kSo7VWve3lLx60kDwoYk5o4cd3mgstS/NfGSLFAQv2hbri7SnLmzyl
 /2YVwdAPE3j3e7AWKBzervUtFJ7y6SaXyB6PYw1xW5ZGurlFJoVlDinhYNUSqYMZJ+iT
 h7M46NFZTEGCbte/s8xBxoGOiVZUXFHTMECWd+DLqDvTwTKLkNYet6vSzYhDUS6mnuX2
 AZnq/k2t+s5nMtvaXOXPWgd7DpesAM71nG5Yeqj/lmTqyz+7I2nGPRo64jpVZxgB5CIo 5g== 
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 46uurn3rfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:35:54 -0400
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c579d37eeeso536387585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748410553; x=1749015353;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+k25hQ+WqRqC0OyADCvElYmO8j09G9PUeHVk4OknG6k=;
        b=fWn/5JiB62umhePu5LRw7WOPzs/Q+DACLEydXQAreqmRXLt6F/fF7V9AurGv3FFN2g
         cyI0MgFkqP1HLFGmu+tbva9hJWJFWoJ6hMUp1yjjfRKMvUf1Q82KnaWc+8ZW0Xvrc9Yu
         Kzqbdkj3D5nokf4zJmLI9N0P8KRwuitRaN8OzY5L0i6tl6uRXa4gBn8VLlBE9n24l9Bi
         x8NouXe4LOLwZpmFM6uf5ssRfS+l/xrRVXJ5KBrKAcyPO16wFiy7IJ1WM0QCDzkLHo7S
         MXgsN6OaOacG0Io7wixkbx1wwJRKBIVhFaK2KjssIhpEl3WVyoDfiTZUhzKYR0VaTHgG
         tGQQ==
X-Gm-Message-State: AOJu0YyDaV+JbaMn5ADiJh1Qbz/Ah4aP8r5nqHUDFDx8ExWXu1f7mxZS
	2toBwXqWRTdSG+pB7GMo8tBrRvBm+032ma3t9Km/veTY3Fe4flr/0m+KgAv4o8hfP+nyiyTrLsK
	+ign4iZ/c3miih/DeFeiNFFswSXoOIMTFEt/yaz7XcDDqfOyHlmTp3Lf2oSJGpQ==
X-Gm-Gg: ASbGncuntCKG7xwexWNhpshRkzqlELINvglVBHRUa/+2cDfMze3GDGd26gktfo6uOaw
	diAvPS+lGpn7ReOJSdpNhtXuJDdJR9RWAPkrocOcW38WXW7l7WQJQlv7a5tP7xaGzsWu7Q9XW/X
	cBoQ2gGbFAYIGkuaLuA7j6ju9gnQz0+PSULuXj3rGS4fcYdnqO9PRwzFQjLFUnc5Xx6TK1NTsPj
	gP2xA2QUtvX2QoJSgHmE6q1m54l6ytXOdSTPqjACBi0TQ/0vHF2hmHQZjvaObiWcTdDaOX3zm8y
	kX97JDxLoHkA2Pqv130rDCrhTWBRmxDQ02Y5e5ZMCwg9ZWtED7yAZcyoaQ==
X-Received: by 2002:a05:620a:24d0:b0:7c9:256d:f6b6 with SMTP id af79cd13be357-7ceecbb2686mr1914477085a.2.1748410553314;
        Tue, 27 May 2025 22:35:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVuanXo3wXM1AX9euh5YA4q4C5WI95jrYBXUd0zPpPyjkxWttoX1vBdNABMij4617XeYMiIA==
X-Received: by 2002:a05:620a:24d0:b0:7c9:256d:f6b6 with SMTP id af79cd13be357-7ceecbb2686mr1914475185a.2.1748410552889;
        Tue, 27 May 2025 22:35:52 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfb82001f9sm32382585a.9.2025.05.27.22.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 22:35:52 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] x86, mm: minor tlb_flush tracepoint adjustments
Date: Wed, 28 May 2025 01:35:35 -0400
Message-Id: <20250528-tlb-trace-fix-v1-0-2e94c58f450d@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKegNmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyML3ZKcJN2SosTkVN20zArd1CTLJLO0ZPOkJCMzJaCegqJUoDDYvOj
 Y2loAZIudhV8AAAA=
X-Change-ID: 20250528-tlb-trace-fix-eb9b6fc7bb26
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Ingo Molnar <mingo@kernel.org>, Rik van Riel <riel@surriel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-mm@kvack.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748410551; l=908;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Cm2WQBvGDdnbOhUgw+aqFyv8b2NNJSYKPCbP57tCM44=;
 b=t2kcAbnO83WgTaP1+e0Xmrvb/1e3wCGsl/ur/UfmoDHLjqvpZ6+9YD9IiDQAfOi+5BEGffmrJ
 4Q7nzNi4c3LBjStISxcXmR0FGALu6M7RYfgif4DEn9BM0zbysG3p6/A
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA0OCBTYWx0ZWRfX899Sr1idZGUB kyJqkKDEMXiB8LLVkJPFN7V91SYiPF1In9RVjjhblqCzxWINUbAJzxFqfOKTLtDQGgvVVlBZ9HF 0WlwGs0UtVy7WR/yvSUj74pgaTk2i8lBn/A3hzi14CwiE5vm39+5uJ7UUce+1Qzac2E5E6bx840
 Zp8QyJMMb8YDBlcgt0/1hU5okRTqB05Je6M5etOelFgIPjDceq8Zy52SFSnSmHWv0ruHQaKudSG w2JzNyk9fXR676W8YOk+X2C016MeqOgUO/MYBUMQNZJT01GwE3mWKbhxVDeYMofu43SEWJ819lv MYgLhmnVsLb6ObzQMPFzXuKNLpatZUG7ZXHEqihTcTsqPkr2DUx2CzuGzDOYVxzL1+3mkWy+6Nk 6K1EpVSq
X-Proofpoint-GUID: Y3IQWRdIvwowEQQ-btDyEeD-vOPZZqe5
X-Proofpoint-ORIG-GUID: Y3IQWRdIvwowEQQ-btDyEeD-vOPZZqe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=10
 mlxscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxlogscore=733
 clxscore=1011 suspectscore=0 phishscore=0 bulkscore=10 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505280048

One minor fix and one minor cleanup related to the tlb_flush tracepoint.

As an aside, include/trace/events/tlb.h isn't covered by MAINTAINERS,
along with other mm related files under include/trace/events/. Flagging
this since I see there's a recent effort to overhaul the mm MAINTAINERS
entries.

It's been a while since I've submitted patches to the mailing list --
please let me know if anything looks off. Thanks!

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
Tal Zussman (2):
      x86/tlb/trace: Export the TLB_REMOTE_WRONG_CPU enum
      mm: Remove tlb_flush_reason::NR_TLB_FLUSH_REASONS

 include/linux/mm_types.h   | 1 -
 include/trace/events/tlb.h | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 200577f69f29a58c90c67c83a0df6d12850e1d09
change-id: 20250528-tlb-trace-fix-eb9b6fc7bb26

Best regards,
-- 
Tal Zussman <tz2294@columbia.edu>

