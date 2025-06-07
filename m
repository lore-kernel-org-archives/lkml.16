Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CC51F0E25
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 16:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749313289; cv=none; b=cDSoYBGLJJy+HXXhGUT4rHuoH9eVR+kNbMrt7WJeW3eV8YQxQg8BQxEq0c1iPjRJowJVwWb1XS5mv9xhwisyYRB4jweZOaBTPzM5SJ1/AKPEGKFF/hV3WyybxUXPpt8AM9viU/SCTPkyYqF25v/wQNWDv6ZwYE8CgsxIB+BmxDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749313289; c=relaxed/simple;
	bh=gxaarNxBmL5TGqpvaW0ezQWztUeBma9gXrJdlM4picI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8i3EusBPvA8q05GGUJLkaAae56mQ/nv7/jMCdxLyE2JLv7Rup9wsFp5e+YM70LcyvkqHXhDPibe+MvQT/wo5DlQZZtpCSi5WH0IZFa9SckJsDa0YCXvMwPjkXAUZ3bYm3DbSMHlKG0nQmK+pgslFIK8d0pzvcAMxs2PWbISask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=A2Vz5jqH; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="A2Vz5jqH"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557E5PEl018159
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 12:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=b1/dkGTH1xeAme9R9t2fbDHSI0S91hJULtQEJ50D1VY=;
 b=A2Vz5jqHTguP+2vmawdts1FsF06GwGS9TdrxjyypO205RZXDQfAmp+0nYOzIBlYLNAQR
 IrqwYnKwhhV1CCeKsCEqG8nbfjFoWO3k2R2Xly5B2Jkghr1Zo7kWMg3kUF8vcEQ8leA6
 jwkdiVHBtbkHc9fWcPXkRTr0xSx55ehsmDX5w145E+QQjKGR4f4Iz+K2UZt1uzQH0LOt
 gOdDok1/r/3nAPAmHU9NOPtoIV7SXLjUhyB40qMXofuYbWTeE2LpUujYelWXe3cP+wPT
 ROTU/pXeJmKSrhOCCnwnpdR66k05cZpy4+ETNdtTVXXi5090LAGF2lXd8pl8jHUXjxCR dw== 
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 474hdr1yaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 12:21:26 -0400
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e72ecef490dso4418097276.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 09:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749313286; x=1749918086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1/dkGTH1xeAme9R9t2fbDHSI0S91hJULtQEJ50D1VY=;
        b=X7XQbzQ1R0IvVI7sRkHviE3JE+0bN1sPu445siPSP9u4hdHaATryru0It5zRN0ncB7
         xH/8MoWU7IboDH9Z/h7G/wWOUdsJBqZA3HNZyj4+hosQoAcXCkW/wtyRb9Z9D5vJPxfW
         2mItWA1vKHdeahoUxXor3GD1JgmdbT2mFdQiEUaL8TwsE9AS7s9bXd3dfdzaydT/FTyb
         HhK+yrQ3xjJY1c1b15qUMoB72PnfbBOgIZeSwCqQwdMuIIpZK1AqG/4iduEuzgQs0WPW
         GqFg3d16LBotsIncIDuzSM7PKrAROf+TljT8Tugjd1FrxXMCwpWx4/EemAsQpuUqHMgp
         4YFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7oLHaOS1oYzCl+/JMqloWceX+JMSF4NdY8eVzIt+y5SzUidw1wGnuof0tsnzmturNdNRF+64AC5ymYPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlEGkjaVK/L28IGcCTVW46sexCMRXhJ50sm8wVFD52lMYdg1li
	LkGiMoftE1wim4lZfvIIUkh3DumuzT+Qew8r4cGDbsCQU94vqzETEi80hYbO3m3ybMCE7dFEnCe
	QV+J4cBXpDNOiCZyRccbh9xiDngGAWHSMXGw/o33NsKm0TzS99BwldMHij0l/cHJntrG9Jak2eX
	fo+X91yR5xY7hVyFWbFZewhkgabpZwq1WZAwuh
X-Gm-Gg: ASbGnctt7NJunJ4gpIs7lDFlHGz5+zwFtqUzn45aT3r3Qd+hKwKtIgw2S+Cp1lYQVXi
	v+HSFJAY95/uXhq29eNr5n+JpkNoHtdydNw2PorD9wIVr+fqnviE/sOklNI2xG49/FE7BHgLH9R
	dtJ6M=
X-Received: by 2002:a05:6902:1ac8:b0:e81:7940:a3d with SMTP id 3f1490d57ef6-e81a20d3aedmr10750101276.10.1749313285867;
        Sat, 07 Jun 2025 09:21:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWyeICt1A7veaAAv59SpFycsXTLfXEYDrG4MaoFSg9L2FwOS/7iU2JS9hVwi/qkCGPwcD0n/I3JBjeaeUGYPg=
X-Received: by 2002:a05:6902:1ac8:b0:e81:7940:a3d with SMTP id
 3f1490d57ef6-e81a20d3aedmr10750078276.10.1749313285509; Sat, 07 Jun 2025
 09:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607-virtual_bug_on_invalid-v1-1-b792ac2b0920@columbia.edu> <2a768123-4423-4f52-a0ef-96fa69872949@redhat.com>
In-Reply-To: <2a768123-4423-4f52-a0ef-96fa69872949@redhat.com>
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 7 Jun 2025 12:21:14 -0400
X-Gm-Features: AX0GCFv6SH9nZ6VnHaOWZJU6oFxtwlJcRVa7KKHc4OLpc_7Y_UCQYQH3crh4lw8
Message-ID: <CAKha_soMjczpY3HTpPVuw-fKTq0ZATdCnaPKPrsnTj_5ROepmA@mail.gmail.com>
Subject: Re: [PATCH] mm/debug: Use BUILD_BUG_ON_INVALID() for VIRTUAL_BUG_ON()
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDExNyBTYWx0ZWRfXw5bJ1ZCYG5+l jrjky60HdOra8DUyezAMQaugWQEyw1WGP6HSXpYy8IdM64Jpa9C0VItMxpNEKf5rLweH1P7EInN 33b7erRJAo8VYEaAyYxZozN5O/giJnl5Lncfsvg9qdsMqtZYkVi3+IbrijMw3L7p6K+caU+9kyl
 SRXY8CtRvkrb5cN/tXEm55SA8TxCItn15tO4W9/YbM8dM7xUTS5K/+ou1BwqhH+N2tpFOb6wO0H 3ymf4gCnHMQPegY5f+Ear7zHXkWDJnQKMtK4djziXbnG8LL2Nn7Z0n/6zgE726Ovr+hFXGvuV/P 6sqHIejyrtd1xZCr8zUGI/gMQrR+d5Caf5PLuyMiqnGp889ON4c4BdE4L8E1o3MZR21wep3/Xne HCbmc4Ha
X-Proofpoint-ORIG-GUID: pmKw4XrHbXeApX3KdkYZWFiHbYFJs46k
X-Proofpoint-GUID: pmKw4XrHbXeApX3KdkYZWFiHbYFJs46k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_07,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=10 suspectscore=0
 mlxlogscore=590 lowpriorityscore=10 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506070117

On Sat, Jun 7, 2025 at 3:59=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
> On 07.06.25 09:09, Tal Zussman wrote:
> > This allows the compiler to validate the condition even with
> > CONFIG_DEBUG_VIRTUAL disabled, and aligns VIRTUAL_BUG_ON() with the
> > other macros in mmdebug.h.
> >
>
> In the light of recent discussions, I think we should get rid of
> VIRTUAL_BUG_ON completely.
>
> There are only a hand full of callers, and I am preety sure for most of
> them VM_WARN_ON is a suitable replacement.

Makes sense. However, all of the callers (except for vmalloc) are already
gated by CONFIG_DEBUG_VIRTUAL, which doesn't depend on CONFIG_DEBUG_VM, so
using VM_WARN_ON_ONCE() would break DEBUG_VIRTUAL on its own.

Perhaps it makes sense to convert the non-vmalloc callers to WARN_ON_ONCE()
instead so DEBUG_VIRTUAL still works. The vmalloc caller would then become

        if (IS_ENABLED(CONFIG_DEBUG_VIRTUAL))
                WARN_ON_ONCE(...);

as opposed to VM_WARN_ON_ONCE(), in order to maintain the existing
DEBUG_VIRTUAL behavior.

Alternatively, DEBUG_VIRTUAL could be folded into DEBUG_VM, but that seems
like a slightly more invasive change...

Thanks,
Tal
