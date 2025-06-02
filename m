Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7082C3253
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748898540; cv=none; b=RveMgpl0t3znu6VcDISGHRPAnfIM1vb9UtDmpgj6XDcfsjNvK5dtJ+XB4fyth8kC9zVyBDrr10LVdmKmy24eNHEBvB+Fjix/UNxjcuBwfzKMinKHYBvQUztoUbb2ETQKGgpvS3d0unaPGJrgzt0ECguA4CiVgg8Xu5HBsxK93JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748898540; c=relaxed/simple;
	bh=XKVuOESW/o1mhextHF2Cw1x5d/SPqOP38X8YIspTF4k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Odag5tR209f+gdIjeb+WSJ5M68KogxtCilMl1pt63VSz4z7+xI0RCQG/kBBEMlmKzysdXYfnCafajx49OgevpJtRAj61VhcqsrJt+ryydbDMimu/4906XnNpyJBDMRJXQYdPW5uhq6vKULXlxKUpyNwkO7Qzp6le8qicTClg8o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihagtM+R; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihagtM+R"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d54214adso16317415e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748898537; x=1749503337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/8L0hwmoewX6XMClNvSa1w1jQ17S1ZfwQS9T8uDa1o=;
        b=ihagtM+R7l/4sDGuMtzpuXQH4d51eTB3fbqHCj/FkM6Bw/+1J7MqDM92ooKoTeUIl8
         lJjuEW2q6f+a+JmtOGA6Y6C6OWr4vXsnGwQzlqON9JAvVLi9n2ESEv8T668ORJxDpiq1
         p6uHVknyWsuNZU6xgxTBNq2e92e9tQWg+HNt65vXcAXchXzBw43Cz08yB14vJ8jOdHfO
         I41I21l8RHEWURYFv2fiT8wN/PD75qjBjYq9u0HAPtW+2K+38oYnNI20vFOVaqa+IV+a
         PedMp/ynu7MX2mV93MqBPTFoSOXtbXeQlECECCdVFWSXhJCaJ/vgFJ7OZbl6uUhYves0
         Azsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748898537; x=1749503337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/8L0hwmoewX6XMClNvSa1w1jQ17S1ZfwQS9T8uDa1o=;
        b=JgIxiOaPUCYNM/Iwafjze5ISsFR/8RrDrmqxhS/UrS5kXiV88AlaTPwDNrJSPhELRc
         u+63GBMQWyU18mqL2KyNVZ01jIz9cmt/6ussW5fVee/WJhUt6KWfB9y5Xo8aC8YLi9T4
         9TPXeJMYaEGNtVJdzPsmgUOeWV+KgpjzDQN/bOujD2CFJ5eCfDhlrlnvsBT7bi/3Lp5C
         YxrQafaNOpXxkhNvg5LUIbYrE+KWigR79flsSh04+Sq9erK1rm8QalmnZIfyXy989W1V
         9jmxO9C4RIi60zGDCCAbf0IwHO6cGqct0Q4S8gvfQtfs3UaC1yzs8D1MDVn+03TWSEEv
         Pzcg==
X-Forwarded-Encrypted: i=1; AJvYcCXTw8KQo8rRcJeDx35GAZ7Cy8H6+dI4XQHf4/MjrUTavl1XRlMxQ0bzyLWE5rgDm1kElWHzYNXkvjopuY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIzigZ8Xh9Yn9goP5OyWtKS5ZG4dpaWqLrX2oMlEBu+ncJUHEK
	V0SrFfwZCyAy+2MZt4lu3gP+DLYQDlieS5W36HF0e2xIozMJ9Y0OnmayKqHsHw==
X-Gm-Gg: ASbGncs8vv6EFXwden18RFuw/p2pn0V2aBK1xbRPLQrEctcSfYqOIzZtn01qE9W1Bxu
	niwjGk6O3xjTfX5ybn2VxeGJ+ZtoTcWykkTSney8SnIpCVPx823Sv5UjYI/hlEu/TyCtrUdvy1k
	CqjG0K7l29drsgoPzLeO5Zi9vA4tmdWHl8J2LgcIfIECWxt8QIoZGH47TSheU/GMe6gdYChyvnh
	Gls9Z77TElYppmscFr+DXlKpTSPpvch8afhPqXBBy+JrIoxKU/N+P2YTFSqdkXSoGbM2s42OGmj
	LSvaE4PNKxOQ2B+gQvXJxyIAyL+VglZGxShdY8E27mDfYynJkCcab15qOt3v89XE8QmWzIC+hyB
	8RbaDM9Rx1dKDBg==
X-Google-Smtp-Source: AGHT+IGiv8lXCx81OoXElhMBnUo+8yluZ62FHU6F3qYBpMOqYqb4VzvN8sVVu800Ue1wccTl9sLyqw==
X-Received: by 2002:a5d:584a:0:b0:3a4:dbdf:7140 with SMTP id ffacd0b85a97d-3a4f7aaf85amr11248071f8f.49.1748898537300;
        Mon, 02 Jun 2025 14:08:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fbf7sm16005839f8f.83.2025.06.02.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 14:08:57 -0700 (PDT)
Date: Mon, 2 Jun 2025 22:08:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v2 0/3] riscv: misaligned: fix misaligned accesses
 handling in put/get_user()
Message-ID: <20250602220855.519e23e5@pumpkin>
In-Reply-To: <20250602193918.868962-1-cleger@rivosinc.com>
References: <20250602193918.868962-1-cleger@rivosinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon,  2 Jun 2025 21:39:13 +0200
Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com> wrote:

...
> The second solution was the one chosen as there are too many callsites to
> put/get_user() that could potentially do misaligned accesses. We tried
> two approaches for that, either split access in two aligned accesses
> (and do RMW for put_user())

You can't do RMW because it is visible to other threads.

	David
