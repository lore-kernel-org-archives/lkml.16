Received: from sxb1plsmtpa01-09.prod.sxb1.secureserver.net (sxb1plsmtpa01-09.prod.sxb1.secureserver.net [188.121.53.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B592063FA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.121.53.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744090973; cv=none; b=c8rLez0nQDVHXb17VTJ9vRV7C0X+FngjUqO8TwytOM0hLPv5Uhr7e/JsSzYzcEjS6mABdo8MEwcy8kGUXA/ZUMZbw6i+i8NOzQMQu5mJL6uP3zIMdCEGdg/K4yUyAeFOpQME/Cp1A/Yg4yAzBpdP2rBgo1FYGfJeT4GgxoPDkSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744090973; c=relaxed/simple;
	bh=LXuGmP+5eI2TnnMyC1FFsctp5JoeYuH/0EnQ5k2XhjE=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=SUPHseaN4trUPpAIyqXqHC+UljMpEsMJ5lyYuNbS0iWjI7imBJqIhrsWOdYb8eCDeXf8Y2fVeJbweogXoPYOC/6VfPx4f89wzRWvc4IShTvwiwywsfcDjDphxSlS7/r9F5HH+oLjgzRaLv788kY8g/UDTipaww6wn9j96rZBzD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; arc=none smtp.client-ip=188.121.53.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id 21bfujqzDxJGd21bhufVIz; Mon, 07 Apr 2025 22:34:46 -0700
X-CMAE-Analysis: v=2.4 cv=ZqoXK87G c=1 sm=1 tr=0 ts=67f4b577
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=FXvPX3liAAAA:8 a=36k9kUrpFmN1ouI47esA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <86290c9b-ba40-4ebd-96c1-d3a258abe9d4@squashfs.org.uk>
Date: Tue, 8 Apr 2025 06:33:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jan Kara <jack@suse.cz>, Andreas Gruenbacher <agruenba@redhat.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>
From: Phillip Lougher <phillip@squashfs.org.uk>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: Recent changes mean sb_min_blocksize() can now fail
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLgiVd6w7M1jJ8sxx/5VfnM0oNjxj3+zXBOKGWp9QyJM+1OrRGPRadhmTQ6uxIhSqs8CBa7rDntCLR/pMBIuPxl6r5O9W6W2eHmmNzqBx2B2OV8KaJ8d
 NuWIkMO2MBbW8c+HnDL7oWTgP+Xf0IENCaa1x/KMyADqDZ/ykUwsOeM1w8AE6wgzeVsAR/GGG7xkRjC8Eee0MOlb+37zD4FuIYV32618X9j9HoRUcBvlMj7o
 dAytz1y+t4Hrwkpgu/27DhsSw/fVcjJqmHpmH7ltEQcu909KQIhOGWTYGsFB7JMBOF3G06EjL7/8r5BGmqyrDSRBp9s5xqtIQyhD/KOcO+j4NGqcI2K8ruV7
 4aVjjIQ0DrPvShzZfA/p4lC0MlGA4rIr5nc/ffkuViWhshlr8bnswblMbKAjliEKAQiYGRLNYpWqOplLP3EqSIb9/0/FI4mDAPmu6ky4MT9G3zTKkI/1yagS
 leM1xnJd5q+2XrIU

Hi,

A recent (post 6.14) change to the kernel means sb_min_blocksize() can now fail,
and any filesystem which doesn't check the result may behave unexpectedly as a
result.  This change has recently affected Squashfs, and checking the kernel code,
a number of other filesystems including isofs, gfs2, exfat, fat and xfs do not
check the result.  This is a courtesy email to warn others of this change.

The following emails give the relevant details.

https://lore.kernel.org/all/2a13ea1c-08df-4807-83d4-241831b7a2ec@squashfs.org.uk/
https://lore.kernel.org/all/129d4f39-6922-44e9-8b1c-6455ee564dda@squashfs.org.uk/

Regards

Phillip
