Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E82EA14D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175285; cv=none; b=qv8K6xoLvBQPvsLb3NjOYjZLLHQ4Z5UdqkpXpoXfhoPxQ2XzBVO0+YAiwdGeFL1yt/bP0dsqal2Vb8vxd4rvOUccjSEjxcI8mrUYVXFyYmZD/c2IR1RkiQ2i8O5/0tC9d0drI7QDxTXVTMBD4CtW4sxLxhT9YnP8UhdCmyVOyB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175285; c=relaxed/simple;
	bh=5SAHH4eQNVP3yaY4tT/lD/hyLuUsmHHCU/z25ej6ssY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=UXpCmmXpVRJn6eFVkjiWWrdjSh92wk4xsDegih3/yYRIZSj9Kmplh75E+7hHIt9cDpWW/inhpuB2D1yq+NkoyWVthZiZsfo6pLD96Iu9YijqU0PBgBjqf2lZ7C+jcn0lgOzoybBtVbjR4GAzd9JkNVB5lRprrsx0b8wLHfV+h30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRIHw9tq; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRIHw9tq"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a43f17c42bso3400461cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750175283; x=1750780083; darn=vger.kernel.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyX03SEsZ9iOiQtVsR2qRfbhcsxh2G3N2TbzbKhdGRY=;
        b=TRIHw9tqK0tFc0wZ2c9o27kUIKaHlF1Eks4XU169zh87jfoORCYW0qMZExNCpCKM4p
         KQ7xLzTxL4bdGpc87KKxVvSxnrLeWim/taISXCsumz+yMZJjOw1Z4m747gtr7EaUAH9T
         sBiex2OZduNzh4Q+l00mQiGjKBp+dty32rBjDDYtiooMxr/a9zKaxdyQzh36RMaxbVlZ
         XuWAwciNdHBHpY9WKiXxAn4Qlh+r+CZ3XONefcoB2V9dMJYoIhRFD7HIMpKcDEsHgJdH
         He14n/RVcQAAE09k0ogXOBMabC24jSsqUATOMY8aaQSvDnQZxkkRojg7c4ETL2u8GoYW
         4XmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175283; x=1750780083;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyX03SEsZ9iOiQtVsR2qRfbhcsxh2G3N2TbzbKhdGRY=;
        b=oz93fHOdztcdrmw3abQnn39fQC8LxMB43lVIu1VPRqPGvo2Egbb8AZkuUV235JFU1f
         5wF6zI+2ctLCCFKAVNWB+3J3y2XUHRw//6lRgFA+L5zThjghkJZ453yue9vCkz/nogFf
         lVbXqAi2nphqVXsXGqfR7tOmIN21tukxZHKW/Xl9WbAg2drwvIB1O4yx3AImTFhJ9mCQ
         hwMWHN1jO1gdJ1YBD6xfMqPdb5Y/7HbWApinkx3MwRJPNDaTvhV23oHzYRgWMP4GTqmq
         fz0VFoXZwonhrCQpNC8B3jVE4jdpguH0H1MbNtRFskbaLl9SGxB+IMun8Z59HCx6p7Gz
         Votg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9nDoxvTsR4XgkSFYkDoUQBVb8cQMUGfNlKIlIvvcQm/n3Tj7NkDAOyuUET+P2t05sR+t0UGk9OJw25E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF5qsvhDuTs6YAM5GJufaBaWfs/lliAegQjfAEqAn0/JOylq7Z
	W23jdaUUYdbLxzOrPpeOw0eFeasdZxneVMNwMUpeH0aK4HQmpznoolJE0K56dQXV11T9oE0XEB/
	oMPWR1vobXpsWjldWUky7VnZeZjZRQC9DiUjL
X-Gm-Gg: ASbGncuVlLNtRXiJ1L9eeQ1mU+HCQdvafhhs/9/MjWK2k8AY8oVpbxN3aXXCz2/QDuX
	ldR18DiUZmTV/gqIvuUTCNynYoXQlGZZ8ddw7xqNO4E912yzAE47q9qwqcbo334aKN1rvpYdc0j
	P22xmO72Bib8vsk7v6U7WunlIUWk/d56QL3evqlPZy6UwFEQgLhHJzCX8w4iahsIEyfWtIVTiTr
	r5x
X-Received: by 2002:a05:622a:d5:b0:4a6:fbd6:a191 with SMTP id
 d75a77b69052e-4a73c4b8b4bmt79239001cf.1.1750175282819; Tue, 17 Jun 2025
 08:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613074356.210332b1@kernel.org> <20250616140246.612740-2-fourier.thomas@gmail.com>
 <20250616104619.75f4fd74@kernel.org>
In-Reply-To: <20250616104619.75f4fd74@kernel.org>
From: Thomas Fourier <fourier.thomas@gmail.com>
Date: Tue, 17 Jun 2025 17:47:50 +0200
X-Gm-Features: AX0GCFt3yEytZ5dyPIUP6NnStffaIIvAR9FrJCMB6dUTpuwBa80iaF59gOu6Lp4
Message-ID: <CA+eMeR2yEa4wsozLP94Zb2gQ67=xhC58PEdOKL8=RzaZotYhSQ@mail.gmail.com>
Subject: Re: [PATCH net] ethernet: alt1: Fix missing DMA mapping tests
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 16/06/2025 19:46, Jakub Kicinski wrote:
> On Mon, 16 Jun 2025 15:59:55 +0200 Thomas Fourier wrote:
>> According to Shuah Khan[1]
> Sorry for a non-technical question -- are you part of some outreach /
> training program? The presentation you linked is from 2013, I wonder
> what made you pick up this particular task.

I am doing a master thesis on static analysis and I am writing a checker
with

Smatch to test if error codes are well-checked.  My supervisor suggested
that

I look at DMA mapping errors checks to see if people were interested in such

patches and because they are quite easy to statically assert.
