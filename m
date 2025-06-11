Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1D91C862C;
	Wed, 11 Jun 2025 04:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749616632; cv=none; b=FOfgPQtHWVYmfDd1ZLCTCcVzHHJ01z8crIdhjH8nsMIwvJKNXdBUooeVQ60OZgaZysWnQfXallkG5lS8Bi/mxdyKzBD/N+xJCFa+O5NwuEvb+8nkjzhn68JbZ8RykPA/xkcToy6ZFN+be+2GyZghf3lAmUcZwiYh7l8a+e0tvxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749616632; c=relaxed/simple;
	bh=yZs47V1oi693c4do0y7QM+Np82SYQyqJ5JEqXGb27As=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HESh52vrrp66qHKXu9SZuUaKe+L3YOeU2DzeVvSRAjYNfqbPkrDXnfOt2LsTMAhJo5ANxudOz+N1CHmYXdTWAH1Ca0+dBLaH36xI17iVVSmxr8cCLsZCjOQaCMWoVlOZn5ml9GDv/4BPiPcB9vYevI15KwPfnmqB4pX1SCBq3Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAAnL3vPB0lofHSOAQ--.7367S2;
	Wed, 11 Jun 2025 12:36:31 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wBHGD3JB0lobZAXAA--.39634S2;
	Wed, 11 Jun 2025 12:36:26 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs/zh_CN: improve formatting and content clarity
Date: Wed, 11 Jun 2025 12:36:13 +0800
Message-ID: <20250611043616.264245-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAnL3vPB0lofHSOAQ--.7367S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoW3Zr1rXF1DAr4Utr47Xr4DXFb_yoW8WF1xuo
	WSv3y5Cw1DtF13Ja45G3ykJFyDWr1Syrs5Aw4UKwnru3WUJa15tws5Ja4YgrySkrW5uFn7
	Xr1Sg34fWa13ZayDn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUO47k0a2IF6w4xM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04
	k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAF
	wI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVF
	xhVjvjDU0xZFpf9x07jhiSdUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

This patch fixes some issues in the how-to.rst:

1. Add spaces between Chinese and English or numbers;
2. Fold some long sentences or commands;
3. Revise a few improper description and add some important tips;

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 Documentation/translations/zh_CN/how-to.rst | 103 +++++++++++---------
 1 file changed, 59 insertions(+), 44 deletions(-)

diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
index 569b0209385a..fa1dc46c2b4a 100644
--- a/Documentation/translations/zh_CN/how-to.rst
+++ b/Documentation/translations/zh_CN/how-to.rst
@@ -1,19 +1,19 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-=========================
-Linux内核中文文档翻译规范
-=========================
+==========================
+Linux 内核中文文档翻译规范
+==========================
 
 修订记录：
- - v1.0 2025年3月28日，司延腾、慕冬亮共同编写了该规范。
+ - v1.0 2025 年 3 月 28 日，司延腾、慕冬亮共同编写了该规范。
 
 制定规范的背景
 ==============
 
 过去几年，在广大社区爱好者的友好合作下，Linux 内核中文文档迎来了蓬勃的发
 展。在翻译的早期，一切都是混乱的，社区对译稿只有一个准确翻译的要求，以鼓
-励更多的开发者参与进来，这是从0到1的必然过程，所以早期的中文文档目录更加
-具有多样性，不过好在文档不多，维护上并没有过大的压力。
+励更多的开发者参与进来，这是从 0 到 1 的必然过程，所以早期的中文文档目录
+更加具有多样性，不过好在文档不多，维护上并没有过大的压力。
 
 然而，世事变幻，不觉有年，现在内核中文文档在前进的道路上越走越远，很多潜
 在的问题逐渐浮出水面，而且随着中文文档数量的增加，翻译更多的文档与提高中
@@ -34,7 +34,7 @@ reviewer 们只能耐心地指导他们如何与社区更好地合作，但是
 ========
 
 工欲善其事必先利其器，如果您目前对内核文档翻译满怀热情，并且会独立地安装
-linux 发行版和简单地使用 linux 命令行，那么可以迅速开始了。若您尚不具备该
+Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了。若您尚不具备该
 能力，很多网站上会有详细的手把手教程，最多一个上午，您应该就能掌握对应技
 能。您需要注意的一点是，请不要使用 root 用户进行后续步骤和文档翻译。
 
@@ -66,11 +66,18 @@ linux 发行版和简单地使用 linux 命令行，那么可以迅速开始了
 	cd linux
 	./scripts/sphinx-pre-install
 
-以Fedora为例，它的输出是这样的::
+以 Fedora 为例，它的输出是这样的::
 
 	You should run:
 
-		sudo dnf install -y dejavu-sans-fonts dejavu-sans-mono-fonts dejavu-serif-fonts google-noto-sans-cjk-fonts graphviz-gd latexmk librsvg2-tools texlive-anyfontsize texlive-capt-of texlive-collection-fontsrecommended texlive-ctex texlive-eqparbox texlive-fncychap texlive-framed texlive-luatex85 texlive-multirow texlive-needspace texlive-tabulary texlive-threeparttable texlive-upquote texlive-wrapfig texlive-xecjk
+		sudo dnf install -y dejavu-sans-fonts dejavu-sans-mono-fonts \
+		     dejavu-serif-fonts google-noto-sans-cjk-fonts graphviz-gd \
+	             latexmk librsvg2-tools texlive-anyfontsize texlive-capt-of \
+		     texlive-collection-fontsrecommended texlive-ctex \
+		     texlive-eqparbox texlive-fncychap texlive-framed \
+		     texlive-luatex85 texlive-multirow texlive-needspace \
+		     texlive-tabulary texlive-threeparttable texlive-upquote \
+		     texlive-wrapfig texlive-xecjk
 
 	Sphinx needs to be installed either:
 	1) via pip/pypi with:
@@ -92,7 +99,8 @@ linux 发行版和简单地使用 linux 命令行，那么可以迅速开始了
 		https://github.com/sphinx-doc/sphinx/pull/8313
 
 请您按照提示复制打印的命令到命令行执行，您必须具备 root 权限才能执行 sudo
-开头的命令。
+开头的命令。**请注意**，最新版本 Sphinx 的文档编译速度有极大提升，强烈建议
+您通过 pip/pypi 安装最新版本 Sphinx。
 
 如果您处于一个多用户环境中，为了避免对其他人造成影响，建议您配置单用户
 sphinx 虚拟环境，即只需要执行::
@@ -126,11 +134,11 @@ sphinx 虚拟环境，即只需要执行::
 检查编译结果
 ------------
 
-编译输出在Documentation/output/目录下，请用浏览器打开该目录下对应
+编译输出在 Documentation/output/ 目录下，请用浏览器打开该目录下对应
 的文件进行检查。
 
-git和邮箱配置
--------------
+Git 和邮箱配置
+--------------
 
 打开命令行执行::
 
@@ -150,11 +158,11 @@ git和邮箱配置
 	       smtpencryption = ssl
 	       smtpserver = smtp.migadu.com
 	       smtpuser = si.yanteng@linux.dev
-	       smtppass = <passwd>      # 建议使用第三方客户端专用密码
+	       smtppass = <passwd>      	# 建议使用第三方客户端专用密码
 	       chainreplyto = false
 	       smtpserverport = 465
 
-关于邮件客户端的配置，请查阅Documentation/translations/zh_CN/process/email-clients.rst。
+关于邮件客户端的配置，请查阅 Documentation/translations/zh_CN/process/email-clients.rst。
 
 开始翻译文档
 ============
@@ -162,8 +170,8 @@ git和邮箱配置
 文档索引结构
 ------------
 
-目前中文文档是在Documentation/translations/zh_CN/目录下进行，该
-目录结构最终会与Documentation/结构一致，所以您只需要将您感兴趣的英文
+目前中文文档是在 Documentation/translations/zh_CN/ 目录下进行，该
+目录结构最终会与 Documentation/ 结构一致，所以您只需要将您感兴趣的英文
 文档文件和对应的 index.rst 复制到 zh_CN 目录下对应的位置，然后修改更
 上一级的 index 即可开始您的翻译。
 
@@ -183,7 +191,7 @@ git和邮箱配置
 译文格式要求
 ------------
 
-	- 每行长度最多不超过40个字符
+	- 每行长度最多不超过 40 个字符
 	- 每行长度请保持一致
 	- 标题的下划线长度请按照一个英文一个字符、一个中文两个字符与标题对齐
 	- 其它的修饰符请与英文文档保持一致
@@ -192,7 +200,7 @@ git和邮箱配置
 
 	.. SPDX-License-Identifier: GPL-2.0
 	.. include:: ../disclaimer-zh_CN.rst  #您需要了解该文件的路径，根
-						据您实际翻译的文档灵活调整
+					       据您实际翻译的文档灵活调整
 
 	:Original: Documentation/xxx/xxx.rst  #替换为您翻译的英文文档路径
 
@@ -203,11 +211,11 @@ git和邮箱配置
 翻译技巧
 --------
 
-中文文档有每行40字符限制，因为一个中文字符等于2个英文字符。但是社区并没有
-那么严格，一个诀窍是将您的翻译的内容与英文原文的每行长度对齐即可，这样，
+中文文档有每行 40 字符限制，因为一个中文字符等于 2 个英文字符。但是社区并
+没有那么严格，一个诀窍是将您的翻译的内容与英文原文的每行长度对齐即可，这样，
 您也不必总是检查有没有超限。
 
-如果您的英文阅读能力有限，可以考虑使用辅助翻译工具，例如 deepseek 。但是您
+如果您的英文阅读能力有限，可以考虑使用辅助翻译工具，例如 deepseek。但是您
 必须仔细地打磨，使译文达到“信达雅”的标准。
 
 **请注意** 社区不接受纯机器翻译的文档，社区工作建立在信任的基础上，请认真对待。
@@ -248,14 +256,17 @@ git和邮箱配置
 
 	Translate .../security/self-protection.rst into Chinese.
 
-	Update the translation through commit b080e52110ea	#请执行git log <您翻译的英文文档路径> 复制最顶部第一个补丁的sha值的前12位，替换掉12位sha值。
+	Update the translation through commit b080e52110ea
 	("docs: update self-protection __ro_after_init status")
+	# 请执行 git log --oneline <您翻译的英文文档路径>，并替换上述内容
 
-	Signed-off-by: Yanteng Si <si.yanteng@linux.dev>	#如果您前面的步骤正确执行，该行会自动显示，否则请检查gitconfig文件。
+	Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
+	# 如果您前面的步骤正确执行，该行会自动显示，否则请检查 gitconfig 文件
 
 保存并退出。
 
-**请注意** 以上四行，缺少任何一行，您都将会在第一轮审阅后返工，如果您需要一个更加明确的示例，请对 zh_CN 目录执行 git log。
+**请注意** 以上四行，缺少任何一行，您都将会在第一轮审阅后返工，如果您需要一个
+更加明确的示例，请对 zh_CN 目录执行 git log。
 
 导出补丁和制作封面
 ------------------
@@ -263,6 +274,7 @@ git和邮箱配置
 这个时候，可以导出补丁，做发送邮件列表最后的准备了。命令行执行::
 
 	git format-patch -N
+	# N 要替换为补丁数量，一般 N 大于等于 1
 
 然后命令行会输出类似下面的内容::
 
@@ -289,10 +301,10 @@ warning 不需要解决::
 	git branch test-trans
 	git am 0001-xxxxx.patch
 	./scripts/checkpatch.pl 0001-xxxxx.patch
-	直接修改您的翻译
+	# 直接修改您的翻译
 	git add .
 	git am --amend
-	保存退出
+	# 保存退出
 	git am 0002-xxxxx.patch
 	……
 
@@ -301,28 +313,30 @@ warning 不需要解决::
 最后，如果检测时没有 warning 和 error 需要被处理或者您只有一个补丁，请跳
 过下面这个步骤，否则请重新导出补丁制作封面::
 
-	git format-patch -N --cover-letter --thread=shallow  #N为您的补丁数量,N一般要大于1。
+	git format-patch -N --cover-letter --thread=shallow
+	# N 要替换为补丁数量，一般 N 大于 1
 
 然后命令行会输出类似下面的内容::
 
 	0000-cover-letter.patch
 	0001-docs-zh_CN-add-xxxxxxxx.patch
 	0002-docs-zh_CN-add-xxxxxxxx.patch
+	……
 
-您需要用编辑器打开0号补丁，修改两处内容::
+您需要用编辑器打开 0 号补丁，修改两处内容::
 
 	vim 0000-cover-letter.patch
 
 	...
-	Subject: [PATCH 0/1] *** SUBJECT HERE ***	#修改该字段，概括您的补丁集都做了哪些事情
+	Subject: [PATCH 0/N] *** SUBJECT HERE *** #修改该字段，概括您的补丁集都做了哪些事情
 
-	*** BLURB HERE ***				#修改该字段，详细描述您的补丁集做了哪些事情
+	*** BLURB HERE ***			  #修改该字段，详细描述您的补丁集做了哪些事情
 
 	Yanteng Si (1):
 	  docs/zh_CN: add xxxxx
 	...
 
-如果您只有一个补丁，则可以不制作封面，即0号补丁，只需要执行::
+如果您只有一个补丁，则可以不制作封面，即 0 号补丁，只需要执行::
 
 	git format-patch -1
 
@@ -345,9 +359,10 @@ warning 不需要解决::
 
 打开上面您保存的邮件地址，执行::
 
-	git send-email *.patch --to <maintainer email addr> --cc <others addr>	#一个to对应一个地址，一个cc对应一个地址，有几个就写几个。
+	git send-email *.patch --to <maintainer email addr> --cc <others addr>
+	# 一个 to 对应一个地址，一个 cc 对应一个地址，有几个就写几个
 
-执行该命令时，请确保网络通常，邮件发送成功一般会返回250。
+执行该命令时，请确保网络通常，邮件发送成功一般会返回 250。
 
 您可以先发送给自己，尝试发出的 patch 是否可以用 'git am' 工具正常打上。
 如果检查正常， 您就可以放心的发送到社区评审了。
@@ -382,15 +397,15 @@ reviewer 的评论，做到每条都有回复，每个回复都落实到位。
 每次迭代一个补丁，不要一次多个::
 
 	git am <您要修改的补丁>
-	直接对文件进行您的修改
+	# 直接对文件进行您的修改
 	git add .
 	git commit --amend
 
 当您将所有的评论落实到位后，导出第二版补丁，并修改封面::
 
-	git format-patch -N  -v 2 --cover-letter --thread=shallow
+	git format-patch -N -v 2 --cover-letter --thread=shallow
 
-打开0号补丁，在 BLURB HERE 处编写相较于上个版本，您做了哪些改动。
+打开 0 号补丁，在 BLURB HERE 处编写相较于上个版本，您做了哪些改动。
 
 然后执行::
 
@@ -414,7 +429,7 @@ reviewer 的评论，做到每条都有回复，每个回复都落实到位。
 如果您发送到邮件列表之后。发现发错了补丁集，尤其是在多个版本迭代的过程中；
 自己发现了一些不妥的翻译；发送错了邮件列表……
 
-git email默认会抄送给您一份，所以您可以切换为审阅者的角色审查自己的补丁，
+git email 默认会抄送给您一份，所以您可以切换为审阅者的角色审查自己的补丁，
 并留下评论，描述有何不妥，将在下个版本怎么改，并付诸行动，重新提交，但是
 注意频率，每天提交的次数不要超过两次。
 
@@ -425,9 +440,9 @@ git email默认会抄送给您一份，所以您可以切换为审阅者的角
 
 	./script/checktransupdate.py -l zh_CN``
 
-该命令会列出需要翻译或更新的英文文档。
+该命令会列出需要翻译或更新的英文文档，结果同时保存在 checktransupdate.log 中。
 
-关于详细操作说明，请参考： Documentation/translations/zh_CN/doc-guide/checktransupdate.rst\
+关于详细操作说明，请参考：Documentation/translations/zh_CN/doc-guide/checktransupdate.rst。
 
 进阶
 ----
@@ -439,8 +454,8 @@ git email默认会抄送给您一份，所以您可以切换为审阅者的角
 常见的问题
 ==========
 
-Maintainer回复补丁不能正常apply
--------------------------------
+Maintainer 回复补丁不能正常 apply
+---------------------------------
 
 这通常是因为您的补丁与邮件列表其他人的补丁产生了冲突，别人的补丁先被 apply 了，
 您的补丁集就无法成功 apply 了，这需要您更新本地分支，在本地解决完冲突后再次提交。
@@ -455,5 +470,5 @@ Maintainer回复补丁不能正常apply
 大部分情况下，是由于您发送了非纯文本格式的信件，请尽量避免使用 webmail，推荐
 使用邮件客户端，比如 thunderbird，记得在设置中的回信配置那改为纯文本发送。
 
-如果超过了24小时，您依旧没有在<https://lore.kernel.org/linux-doc/>发现您的邮
-件，请联系您的网络管理员帮忙解决。
+如果超过了 24 小时，您依旧没有在<https://lore.kernel.org/linux-doc/>发现您的
+邮件，请联系您的网络管理员帮忙解决。
-- 
2.43.0

