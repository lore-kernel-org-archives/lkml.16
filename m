Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FE91624E1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463720; cv=none; b=GH8MyqM0n1psoLtMntj+Ot5mDn4IgfUh1n6fn8uJbZ1yHGJjVmDVOLiNuUM+dW+pwf9GKx7SVjl1hf0q5X02yggx1WmrvsH5ZP15sfdVPCXSyCD7Ko2NrypZ9/2HeNnDlQcEsxIiWwiCwrEVhB9oM6VGd5EjIKFT4dSKlRv9h/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463720; c=relaxed/simple;
	bh=b7pxCULpm20JFy6r/oOANL31+tW9KjmRDtjR0yp8gVw=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=YO4JtE9mMZkN2PEwwRX8ZnLtRD/6QIqinD6MSQPgB+lmKjUtUIo4AcrKLfwyfpavszYMKxmDZcfL4TbBDSHOjbcACKPMsh71tGWI6DOd4o6+GzZe+hfrH4rsxobGlENaJ3nzMHQcRl4zrthb1gutKjyhKYDr/8WmfHgU1fXvZ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QzAlb1xA; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QzAlb1xA"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751463716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tph6Iri6OgFsPEJii+Yj5f7810J94MTfrMXRVTOuE/s=;
	b=QzAlb1xAmEq/dA2u+DNC5lPfiRug48cMefhMZnNl1TXOeUHoP7sQJzu1TIKHBzT/OVTFfu
	XvpX8CHJcTjq6LBZ1DXu9t2lBH8Dwzf7/urcOyCHEDmxXo+m5Qx5wVuXV9PIZDN0+40NzN
	eXxfOrtXXl9+ItWSg4aJJmtqwPGXAr0=
Date: Wed, 02 Jul 2025 13:41:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jiayuan Chen" <jiayuan.chen@linux.dev>
Message-ID: <c9c5d36bc516e70171d1bb1974806e16020fbff1@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net-next v1] tcp: Correct signedness in skb remaining
 space calculation
To: netdev@vger.kernel.org
Cc: mrpre@163.com, "Eric Dumazet" <edumazet@google.com>, "Neal Cardwell"
 <ncardwell@google.com>, "Kuniyuki Iwashima" <kuniyu@google.com>, "David
 S. Miller" <davem@davemloft.net>, "David Ahern" <dsahern@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "David Howells" <dhowells@redhat.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250702110039.15038-1-jiayuan.chen@linux.dev>
References: <20250702110039.15038-1-jiayuan.chen@linux.dev>
X-Migadu-Flow: FLOW_OUT

July 2, 2025 at 19:00, "Jiayuan Chen" <jiayuan.chen@linux.dev> wrote:


>=20
>=20The calculation for the remaining space, 'copy =3D size_goal - skb->l=
en',
>=20
>=20was prone to an integer promotion bug that prevented copy from ever b=
eing
>=20
>=20negative.
>=20
>=20The variable types involved are:
>=20
>=20copy: ssize_t (long)
>=20
>=20size_goal: int
>=20
>=20skb->len: unsigned int
>=20
>=20Due to C's type promotion rules, the signed size_goal is converted to=
 an
>=20
>=20unsigned int to match skb->len before the subtraction. The result is =
an
>=20
>=20unsigned int.
>=20
>=20When this unsigned int result is then assigned to the s64 copy variab=
le,
>=20
>=20it is zero-extended, preserving its non-negative value. Consequently,
>=20
>=20copy is always >=3D 0.
>=20

To=20better explain this problem, consider the following example:
'''
#include <sys/types.h>
#include <stdio.h>
int size_goal =3D 536;
unsigned int skblen =3D 1131;

void main() {
	ssize_t copy =3D 0;
	copy =3D size_goal - skblen;
	printf("wrong: %zd\n", copy);

	copy =3D size_goal - (ssize_t)skblen;
	printf("correct: %zd\n", copy);
	return;
}
'''
Output:
'''
wrong: 4294966701
correct: -595
'''
